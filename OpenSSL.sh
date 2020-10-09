#!/bin/bash


## VARS
CERTIFICATE=localServer.crt
CERTIFICATE_KEY=localServer.key


## FUNCTIONS
create_cert() {
    echo "Create certificate"
    openssl req \
        -x509 -nodes -newkey rsa:2048 -config openssl-temp.cnf \
        -days 365\
        -subj '/C=SP/ST=Barcelona/L=Barcelona/CN=localgrizzly.com' \
        -keyout localServer.key \
        -out localServer.crt
    echo "Add certificate to trusted"
    sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain "$CERTIFICATE"
    
}

echo -e '
\e[96m   __________  \e[33m  __________    \e[91m ___  \e[92m  ___________  \e[95m ___________  \e[96m  ____  \e[92m  ____      ____
\e[96m  /     _____| \e[33m | |  ___    \  \e[91m|___| \e[92m |____       | \e[95m|____       | \e[96m |  | | \e[92m  \ \ \    / / /
\e[96m /    _______| \e[33m | | |   |    | \e[91m ___  \e[92m |______    /  \e[95m|______    /  \e[96m |  | | \e[92m   \ \ \  / / /
\e[96m|    |   _____ \e[33m |    \_/    /  \e[91m|   | \e[92m     /     /   \e[95m    /     /   \e[96m |    | \e[92m    \ \ \/ / /
\e[96m|  \  \_|  | | \e[33m |    __    /   \e[91m|   | \e[92m    /  /  /__  \e[95m   /  /  /__  \e[96m |    |____  \e[92m\      /
\e[96m \  \      | | \e[33m | | |  \ \ \   \e[91m| | | \e[92m   /  /   ___| \e[95m  /  /   ___| \e[96m |      ___| \e[92m | || |
\e[96m  \__________| \e[33m |_|_|   \_\_\  \e[91m|_|_| \e[92m  |__________| \e[95m |__________| \e[96m |_________| \e[92m |____|

'

echo "Installing local certificate. You will need sudo permissions"
create_cert
echo "Certificate installed"

exit 0

