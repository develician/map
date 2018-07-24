require('dotenv').config();

import Koa from 'koa';
import Router from 'koa-router';
import bodyParser from 'koa-bodyparser';

import api from './api';

import mongoose from 'mongoose';

const { PORT: port = 4000, MONGO_URI: mongoURI } = process.env;

mongoose.Promise = global.Promise;
if (mongoURI !== undefined) {
  mongoose
    .connect(
      mongoURI,
      { useNewUrlParser: true }
    )
    .then(() => {
      console.log('connected to mongo db');
    })
    .catch((e: any) => {
      console.error(e);
    });
}

const app = new Koa();
const router = new Router();

app.use(bodyParser());

router.use('/api', api.routes());

app.use(router.routes()).use(router.allowedMethods());

app.listen(port, () => {
  console.log('app is listening port', port);
});
