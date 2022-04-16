==============================
 A template was not provided. This is likely because you're using an outdated version of create-react-app.  
==============================
/* Answer to: "A template was not provided. This is likely because you're using an outdated version of create-react-app." */  /*   If you've previously installed create-react-app globally via npm   install -g create-react-app, we recommend you uninstall the   package using npm uninstall -g create-react-app to ensure that npx   always uses the latest version.    Use either one of the below commands:   &bull; npx create-react-app my-app   &bull; npm init react-app my-app   &bull; yarn create react-app my-app */
npx --ignore-existing create-react-app
if react is installed globally, run this: npm uninstall -g create-react-app  then run this: npx create-react-app {directory name}
  
==============================
154 at  2021-10-29T15:22:52.000Z
==============================
