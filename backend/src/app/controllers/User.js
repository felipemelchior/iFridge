import * as Yup from 'yup';
import cepPromise from 'cep-promise';
import api from '../../services/api';

import User from '../models/User';

async function checkCEP(cep) {
  const { street, city } = await cepPromise(cep);

  const string = `${
    street
      ? street
          .normalize('NFD')
          .replace(/[\u0300-\u036f]/g, '')
          .replace(/ /g, '+')
      : ''
  }+${
    city
      ? city
          .normalize('NFD')
          .replace(/[\u0300-\u036f]/g, '')
          .replace(/ /g, '+')
      : ''
  }`;

  const response = await api.get(string);

  return response.data[0];
}

class UserController {
  async store(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string().required(),
      address: Yup.string()
        .required()
        .required(),
      email: Yup.string()
        .email()
        .required(),
      password: Yup.string()
        .required()
        .min(6),
      cep: Yup.string().required(),
      merchant: Yup.boolean(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validations Fails' });
    }

    const userExists = await User.findOne({ where: { email: req.body.email } });

    if (userExists) {
      return res.status(400).json({ error: 'User already exists' });
    }

    const { name, email, address, password, merchant, cep } = req.body;

    const { lat, lon } = await checkCEP(cep);

    const { id } = await User.create({
      name,
      email,
      address,
      password,
      merchant,
      cep,
      latitude: lat,
      longitude: lon,
    });

    return res.json({
      id,
      name,
      email,
      address,
      merchant,
      cep,
      lat,
      lon,
    });
  }

  async update(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string(),
      address: Yup.string(),
      cep: Yup.string(),
      email: Yup.string().email(),
      oldPassword: Yup.string().min(6),
      password: Yup.string()
        .min(6)
        .when('oldPassword', (oldPassword, field) =>
          oldPassword ? field.required() : field
        ),
      confirmPassword: Yup.string().when('password', (password, field) =>
        password ? field.required().oneOf([Yup.ref('password')]) : field
      ),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation Fails' });
    }

    const { email, oldPassword } = req.body;

    const user = await User.findByPk(req.userId);

    if (email !== user.email) {
      const userExists = await User.findOne({
        where: { email },
      });

      if (userExists) {
        return res.status(400).json({ error: 'User already exists' });
      }
    }

    if (oldPassword && !(await user.checkPassword(oldPassword))) {
      return res.status(401).json({ error: 'Password does not match' });
    }

    const { lat, lon } = await checkCEP(req.body.cep);

    await user.update({ ...req.body, latitude: lat, longitude: lon });

    const { id, name, address, cep } = await User.findByPk(req.userId);

    return res.json({ id, name, email, address, cep });
  }
}

export default new UserController();
