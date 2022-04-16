==============================
 Firebase: Firebase App named '[DEFAULT]' already exists  
==============================
if (!firebase.apps.length) {    firebase.initializeApp({}); }else {    firebase.app(); // if already initialized, use that one } 
if (!firebase.apps.length) {     firebase.initializeApp({}); }
// Config file import * as firebase from "firebase";  const config = {...};  export default !firebase.apps.length ? firebase.initializeApp(config) : firebase.app();  // Other file import firebase from '../firebase'; ... console.log(firebase.name); console.log(firebase.database());
if (!firebase.apps.length) {     firebase.initializeApp(firebaseConfig); }
// Config file import * as firebase from "firebase";  const config = {...};  export default !firebase.apps.length ? firebase.initializeApp(config) : firebase.app();  // Other file import firebase from '../firebase'; ... console.log(firebase.name);
  
==============================
220 at  2021-10-29T15:22:52.000Z
==============================
