import { createStore, applyMiddleware, compose } from 'redux';
import penderMiddleware from 'redux-pender';

import rootReducer from './modules';
const middlewares = [penderMiddleware()];

const isDev = process.env.NODE_ENV === 'development';
const devTools = isDev && (window as any).__REDUX_DEVTOOLS_EXTENSION_COMPOSE__;
const composeEnhancers = devTools || compose;

export default function configureStore(preloadedState: any) {
  const store = createStore(
    rootReducer,
    preloadedState,
    composeEnhancers(applyMiddleware(...middlewares))
  );
  return store;
}
