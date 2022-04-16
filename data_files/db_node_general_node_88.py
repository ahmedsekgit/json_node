==============================
Update Node.js with NVM (Node Version Manager)  
==============================
Update Node.js with NPM (Node Package Manager)

As an alternative, you can use Node’s official package manager to update Node.js. 
NPM is a tool for installing and managing package dependencies.

If you have Node on your system, you have NPM, as well. With the npm command,
 you can check running Node.js versions and install the latest release.

By adding the n module, you can interactively manage Node.js versions.

1. First, clear the npm cache:

npm cache clean -f

clear npm cache

2. Install n, Node’s version manager:

npm install -g n

3. With the n module installed, you can use it to:

Install the latest stable version:

sudo n stable

Install the latest release:

sudo n latest

Install a specific version:

sudo n [version.number]
  
==============================
88 at  2021-10-29T15:22:52.000Z
==============================
