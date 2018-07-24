import { combineReducers } from 'redux';
import base, { BaseState } from './base';
import auth, { AuthState } from './auth';
import { penderReducer as pender } from 'redux-pender';

export default combineReducers({
  base,
  auth,
  pender,
});

export type State = {
  base: BaseState;
  auth: AuthState;
  pender: {
    pending: any;
    success: any;
    failure: any;
  };
};
