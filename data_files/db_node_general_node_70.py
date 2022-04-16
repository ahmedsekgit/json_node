==============================
How can I add an application to the list of Open With applications?  
==============================
If you have /usr/share/applications/$application.desktop, change
Exec=$command
to
Exec=$command %F

[Desktop Entry]
Encoding=UTF-8
Name=Sublime text 3
Exec=/opt/sublime_text_3/sublime_text_3 %F
Icon=/opt/sublime_text_3/Icon/256x256/sublime-text.png
Terminal=true
Type=Application
Categories=Texteditor;Favorite;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognitos;

  
==============================
70 at  2021-10-29T15:22:52.000Z
==============================
