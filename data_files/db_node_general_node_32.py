==============================
How to Install Firefox Developer Edition on Ubuntu  
==============================
Step 1: Download the .tar file from Mozilla’s website. please note the .tar file name because it changes with every update

Step 2: Open Terminal

Ctrl+Alt+T

Step 3: cd into Downloads folder

cd Downloads

Step 4: Copy .tar file into /opt folder

sudo cp -rp firefox-67.0b10.tar.bz2 /opt

Step 5: Delete the .tar file by running

sudo rm -rf firefox-67.0b10.tar.bz2

Step 6: Go back to home directory by running.

cd ~

Step 7: Navigate into /opt folder by running

cd /opt

Step 9: Un-tar the .tar file.

sudo tar xjf firefox-67.0b10.tar.bz2

Step 10: Clean up by deleting tar file.

sudo rm -rf firefox-67.0b10.tar.bz2

Step 11: Lets change ownership of the folder containing Firefox Developer Edition /opt/firefox

sudo chown -R $USER /opt/firefox

Step 12: Open.bashrc file by running

nano ~/.bashrc

Step 13: Copy and paste this line that sets the path for the executable file: export PATH=/opt/firefox/firefox:$PATH

Step 14: Close the file Ctrl+X , then save by typing Y , when prompted for file name just click Enter

Step 15: The last step would run a command to create a Unity desktop file for your launcher. After we create this file, we’ll be able to search for “Firefox Developer Edition” in your Unity launcher to start up our browser.

cat > ~/.local/share/applications/firefoxDeveloperEdition.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Firefox Developer Edition
Exec=/opt/firefox/firefox
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;Favorite;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognitos;
EOL

  
==============================
32 at  2021-10-29T15:22:52.000Z
==============================
