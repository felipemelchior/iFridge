import User from '../models/User';

export default async (req, res, next) => {
  const { userId } = req;
  const userDetails = await User.findByPk(userId);
  const { merchant } = userDetails;

  if (merchant) {
    req.merchant = merchant;
    next();
  } else {
    return res.json({ error: 'Service only available to merchants' });
  }
};
