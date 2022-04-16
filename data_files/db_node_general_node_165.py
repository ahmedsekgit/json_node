==============================
 Can't find Node.js binary "node": path does not exist. Make sure Node.js is installed and in your PATH, or set the "runtimeExecutable" in your launch.json  
==============================
    "runtimeExecutable": "/usr/local/bin/node" 
// inside launch.json {   	...   	"configurations": [     	{           	... 			// add this line: 			"runtimeExecutable": "/usr/local/bin/node" 	        ...         }     ] }
# VS CODE  ### Debugging  // launch.json {   "version": "15.4.0",   "configurations": [     {       "type": "node",       "runtimeVersion": "15.4.0",       "request": "launch",       "name": "Launch",       "program": "${workspaceFolder}/index.js"     }   ] }
  
==============================
165 at  2021-10-29T15:22:52.000Z
==============================
