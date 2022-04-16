==============================
 Cannot find module './data.json'. Consider using '--resolveJsonModule' to import module with '.json' extension  
==============================
add to tsconfig.json  { 	...     "resolveJsonModule": true   } }
import {default as a} from "a.json"; a.primaryMain
  
==============================
169 at  2021-10-29T15:22:52.000Z
==============================
