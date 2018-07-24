import produce from 'immer';
import { createAction, handleActions } from 'redux-actions';
import * as AuthAPI from 'lib/api/auth';
// import { pender } from 'redux-pender';

const CHANGE_INPUT = 'auth/CHANGE_INPUT';
const REGISTER = 'auth/REGISTER';

export type Input = {
  email: string;
  name: string;
  username: string;
  password: string;
};

type ChangeInputPayload = { name: string; value: string };

export const authActions = {
  changeInput: createAction<ChangeInputPayload, ChangeInputPayload>(
    CHANGE_INPUT,
    (payload: ChangeInputPayload) => payload
  ),
  register: createAction(REGISTER, AuthAPI.register),
};

type ChangeInputAction = ReturnType<typeof authActions.changeInput>;

export type AuthState = {
  input: Input;
};

const initialState: AuthState = {
  input: {
    email: '',
    name: '',
    username: '',
    password: '',
  },
};

const reducer = handleActions<AuthState, any>(
  {
    [CHANGE_INPUT]: (state: AuthState, action: ChangeInputAction) => {
      return produce(state, draft => {
        if (action.payload === undefined) {
          return;
        }
        const { name, value } = action.payload;
        draft.input[name] = value;
      });
    },
    // ...pender({
    //     type: REGISTER,
    //     onSuccess: (state: AuthState) => {
    //         return produce(state, draft => {
    //         })
    //     }
    // })
  },
  initialState
);

export default reducer;
