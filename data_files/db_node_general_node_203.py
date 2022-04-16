==============================
 Error: It looks like you are passing several store enhancers to createStore(). This is not supported. Instead, compose them together to a single function.  
==============================
import { createStore, compose, applyMiddleware } from 'redux'; import thunk from 'redux-thunk'; import reducers from '../reducers';  const composeEnhancer = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;  const store = createStore(   reducers,   composeEnhancer(applyMiddleware(thunk)), );  export default store;
  
==============================
203 at  2021-10-29T15:22:52.000Z
==============================
