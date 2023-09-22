# linux
code --list-extensions > vscode-extensions.list // get extensions
cat vscode-extensions.list | xargs -L 1 code --install-extension // install 

# windows 
code --list-extensions > extensions.list
cat extensions.list |% { code --install-extension $_}

# uninstall all extensions

code --list-extensions | xargs -L 1 code --uninstall-extension
%USERPROFILE%\.vscode\extensions // windows


ctrl+shift+L -> select all occurences
shift+q - > quickfix
