import { combineReducers } from 'redux';
import base, { BaseState } from './base';
import { penderReducer as pender } from 'redux-pender';

export default combineReducers({
  base,
  pender,
});

export type State = {
  base: BaseState;
  pender: {
    pending: any;
    success: any;
    failure: any;
  };
};
