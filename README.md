# Bash.ly
This simple utility was only a development exercise, expect bugs and weird stuff while using it.

Fast shrink an url from terminal.
##Installation
You'll need to insert in the code your auth key for bit.ly (no worries! Just register/login and ask for it here: http://bit.ly/1ECVkRV) at line 16. (`newConn.auth_code`)

Compile the utility running `sudo make` inside Bash.ly dir. 
After that, the command `short` will be available anywhere from your terminal.
To remove it use `sudo rm /usr/bin/short`.

##Usage
Open your teminal after installing, and type `short <website>`.
The shrinked link will be copied to your Clipboard. CMD-v to paste it.
