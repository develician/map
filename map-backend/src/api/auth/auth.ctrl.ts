import Joi from 'joi';
import Account from 'models/Account';
import crypto from 'crypto';

const login = async ctx => {
  ctx.body = 'login';
};

const checkExistingEmail = async (email: string) => {
  let account = await Account.findOne({ email }).exec();
  console.log(account);
  if (account) {
    return true;
  }
  return false;
};

const checkExistingUsername = async (username: string) => {
  let account = await Account.findOne({ 'profile.username': username }).exec();
  if (account) {
    return true;
  }
  return false;
};

const hashPassword = (password: string): string => {
  const { SECRET_KEY } = process.env;
  if (SECRET_KEY === undefined) {
    return '';
  }
  return crypto
    .createHmac('sha256', SECRET_KEY)
    .update(password)
    .digest('hex');
};

const register = async ctx => {
  const schema = Joi.object().keys({
    email: Joi.string()
      .email()
      .required(),
    username: Joi.string()
      .alphanum()
      .min(4)
      .max(15)
      .required(),
    name: Joi.string()
      .min(2)
      .max(15)
      .required(),
    password: Joi.string()
      .required()
      .min(6),
  });

  const result = Joi.validate(ctx.request.body, schema);

  if (result.error) {
    console.log(result.error);
    ctx.status = 400;
    return;
  }

  const { username, email, password, name } = ctx.request.body;

  try {
    let existingEmail = await checkExistingEmail(email);
    if (existingEmail) {
      console.log('existing email');
      ctx.status = 409;
      return;
    }
    let existingUsername = await checkExistingUsername(username);
    if (existingUsername) {
      console.log('existing username');
      ctx.status = 409;
      return;
    }
    const hashedPassword = hashPassword(password);
    if (hashedPassword === '') {
      ctx.status = 400;
      return;
    }

    let account = new Account({
      profile: {
        username,
      },
      email,
      password: hashedPassword,
      name,
    });

    account.save();

    ctx.body = account;
    ctx.status = 201;
  } catch (e) {
    ctx.throw(e, 500);
  }
};

export default { login, register };
