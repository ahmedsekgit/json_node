==============================
 How to uninstall npm modules in node js?  
==============================
The command is simply npm uninstall <name> // Here are different options: // - removes the module from node_modules but  //   does NOT update package.json npm uninstall <name>  // - removes it from dependencies in package.json aswell npm uninstall <name> --save  // - removes it from devDependencies in package.json aswell npm uninstall <name> --save-dev  // -  also removes it globally  npm uninstall -g <name> --save   //    If you're removing a global package, however, any applications  //    referencing it will crash.  // A local install will be in the node_modules/ directory of your  //  application. This won't affect the application if a module remains //  there with no references to it.  // The Node.js documents https://npmjs.org/doc/ have all the commands // that you need to know with npm.
npm uninstall <package_name>
Simply use below command in cmd and change module_name with different modules  >npm uninstall <module_name>
  
==============================
254 at  2021-10-29T15:22:52.000Z
==============================
