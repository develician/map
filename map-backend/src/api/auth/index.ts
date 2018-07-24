import Router from 'koa-router';
import authCtrl from './auth.ctrl';

const auth = new Router();

auth.post('/login', authCtrl.login);
auth.post('/register', authCtrl.register);

export default auth;
