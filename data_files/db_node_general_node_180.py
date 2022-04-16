==============================
 Consider using '--resolveJsonModule  
==============================
add "resolveJsonModule": true key in tsconfig.json  {   "compilerOptions": {     "target": "es2015",     "module": "commonjs",     "strict": true,     "moduleResolution": "node",     "resolveJsonModule": true   } }
add to tsconfig.json  { 	...     "resolveJsonModule": true   } }
declare module "*.json" {   const value: any;   export default value; } 
__code-examples__javascript__Consider_using_'--resolveJsonModule__?
add "resolveJsonModule": true key in tsconfig.json  {   "compilerOptions": {     "target": "es2015",     "module": "commonjs",     "strict": true,     "moduleResolution": "node",     "resolveJsonModule": true   } }
add to tsconfig.json  { 	...     "resolveJsonModule": true   } }
declare module "*.json" {   const value: any;   export default value; } 
  
==============================
180 at  2021-10-29T15:22:52.000Z
==============================
