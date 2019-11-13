import User from '../models/User';

export default async (req, res, next) => {
  const { userId } = req;
  const userDetails = await User.findByPk(userId);
  const { merchant } = userDetails;

  req.merchant = merchant;

  next();
};
