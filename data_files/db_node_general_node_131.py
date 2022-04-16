==============================
 'ts-node' não é reconhecido como um comando interno ou externo, um programa operável ou um arquivo em lotes.  
==============================
I just encountered a similar issue: on Mac OS --exec ts-node works, on Windows it doesn't.  My workaround is to create a nodemon.json like this:  {   "watch": "src/**/*.ts",   "execMap": {     "ts": "ts-node"   } } and change the package.json scripts section to  "scripts": {   "start": "nodemon src/index.ts" },
  
==============================
131 at  2021-10-29T15:22:52.000Z
==============================
