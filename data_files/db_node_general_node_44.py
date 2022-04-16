==============================
sudo apt-get install alacarte  
==============================
alacarte is a graphical editor for the freedesktop.org menus that are used by many desktop
       environments. It can also edit and create application desktop files.
il permet de faire ce que fait cette commande:
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
44 at  2021-10-29T15:22:52.000Z
==============================
