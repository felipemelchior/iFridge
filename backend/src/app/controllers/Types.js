import * as Yup from 'yup';
import Types from '../models/Types';

class TypesController {
  async index(req, res) {
    const types = await Types.findAll();

    return res.json(types);
  }

  async store(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string().required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validations Fails' });
    }

    const { name } = req.body;

    const typeExists = await Types.findOne({where: { name }})

    if(typeExists) {
      return res.status(400).json({error: 'Type already exists'})
    }

    await Types.create({ name });

    return res.json({ message: 'Type added to database' });
  }
}

export default new TypesController();
