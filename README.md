# Open SSL on bash_profile

For install your open_ssl keys follow this 3 steps

### Run this command
```
code ~/.bash_profile
```

### Add the follow lines
```
export LOCAL_SSL_PATH="/Users/$USER/.localhost-ssl"
echo '\e[33mexportet    \e[91m-> \e[96m  Local SSL path'
```
you will need to do it as sudo.

### Go to the project folder and run

```
bash OpenSSL.sh
```
after this you will have your certificate for localgrizzly.com and you will can use ut as https.