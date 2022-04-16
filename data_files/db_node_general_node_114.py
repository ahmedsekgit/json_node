==============================
GitHub Error: Authentication Failed from the Command Line                          
==============================
After setting up 2 Factor Authentication on GitHub, I couldn’t push my remote repositories from the command line anymore.

When I tried to push a remote repo, the command line threw this error:

~ :> git push origin my-branch
Username for 'https://github.com': myusernamePassword for 'https://myusername@github.com': mypasswordremote: Invalid username or password.fatal: Authentication failed for 'https://github.com/my-repository’

The error stumped me — and made me vow that, when I did ultimately get to the bottom of it, I’d do my best to pay the knowledge forward.
How to Authenticate on GitHub with 2FA

Command line authentication requires a personal access token.

Go to Settings:

Then Developer Settings:

Then Personal access tokens:

Generate a new Personal Access Token. Make sure you copy the Personal Access Token as soon as it gets generated — you won’t be able to see it again!

Paste the Personal Access Token into the “Password” field when you authenticate via the command line.

GitHub has published official instructions for this flow here (though without glam screenshots…)

Hope this helps — happy coding!
                      
==============================
114 at  2021-10-29T15:22:52.000Z
==============================
