import produce from 'immer';
import { createAction, handleActions } from 'redux-actions';
// import { pender } from 'redux-pender';

const MOCK_BASE_ACTION = 'base/MOCK_BASE_ACTION';

export const baseActions = {
  mockBase: createAction<{}>(MOCK_BASE_ACTION),
};

type MockBaseAction = ReturnType<typeof baseActions.mockBase>;

export type BaseState = {
  mock: string;
};

const initialState: BaseState = {
  mock: '',
};

const reducer = handleActions<BaseState, any>(
  {
    [MOCK_BASE_ACTION]: (state: BaseState, action: MockBaseAction) => {
      return produce(state, draft => {
        draft.mock = 'mock';
      });
    },
  },
  initialState
);

export default reducer;
