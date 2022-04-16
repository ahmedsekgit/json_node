==============================
sublime text macros  et sublime text premiere installation utilisation  
==============================
1 aller sur tools et installer package controle 
2-installer dark theme en changeant theme dans Preferences-> Theme -> adaptive
3-installer via package contol un scheme comme : 1337 Color Scheme, darkula, DarkNeon..

selectionner preferences key bindings
ajouter ceci pour user

{ "keys": [<key sequence>], "command": "run_macro_file", "args": {"file": "Packages/User/<file name>.sublime-macro"} }

So, if you want to assign Ctrl+Shift+X to a macro which has been saved as "add comma to end", the keybinding line will look like so:

[
    { "keys": ["ctrl+shift+x"], "command": "run_macro_file", "args": {"file": "Packages/User/add comma to end.sublime-macro"} }
]
dans mon cas 
[
    { "keys": ["ctrl+e"], "command": "run_macro_file", "args": {"file": "Packages/User/add_semi_colon.sublime-macro"} },
    { "keys": ["alt+w", "alt+w"], "command": "run_macro_file", "args": {"file": "Packages/User/php_print_r.sublime-macro"} },
    { "keys": ["alt+d", "alt+d"], "command": "run_macro_file", "args": {"file": "Packages/User/php_die.sublime-macro"} },
    { "keys": ["alt+e", "alt+e"], "command": "run_macro_file", "args": {"file": "Packages/User/php_echo.sublime-macro"} }
]

RECORD MACRO + STOP RECORDING MACRO  + SAVE MACRO  et lui donner les noms : php_print_r.sublime-macro, ..
on appuie sur alt+w 2 fois ca donne le print_r qu on a enregistre 
  
==============================
42 at  2021-10-29T15:22:52.000Z
==============================
