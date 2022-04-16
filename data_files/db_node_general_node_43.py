==============================
How do I assign a keyboard shortcut to recorded macro in Sublime Text  
==============================
{ "keys": [<key sequence>], "command": "run_macro_file", "args": {"file": "Packages/User/<file name>.sublime-macro"} }

So, if you want to assign Ctrl+Shift+X to a macro which has been saved as "add comma to end", 
the keybinding line will look like so:

[
    { "keys": ["ctrl+shift+x"], "command": "run_macro_file", "args": {"file": "Packages/User/add comma to end.sublime-macro"} }
]
  
==============================
43 at  2021-10-29T15:22:52.000Z
==============================
