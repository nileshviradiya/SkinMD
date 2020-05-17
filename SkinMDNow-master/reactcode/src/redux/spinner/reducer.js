import actions from './actions';

const initState = {
  isActivatedLoader: false,
};

export default function(state = initState, action) {
  switch (action.type) {
    case actions.SWITCH_ACTIVATION_LOADER:
      return {
        ...state,
        isActivatedLoader: !state.isActivatedLoader
      };
    default:
      return state;
  }
}
