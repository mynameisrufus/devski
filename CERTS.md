Generate SSL certs for https.

http://wiki.nginx.org/HttpSslModule

```shell
openssl genrsa -des3 -out dev.key 1024
openssl req -new -key dev.key -out dev.csr
cp dev.key dev.key.org
openssl rsa -in dev.key.org -out dev.key
openssl x509 -req -days 365 -in dev.csr -signkey dev.key -out dev.crt
```
