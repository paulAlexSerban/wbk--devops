openssl req -x509 -out backend/proxy/openssl/localhost.crt -keyout backend/proxy/openssl/localhost.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=paulserban.eu' -extensions EXT -config <( \
   printf "[dn]\nCN=paulserban.eu\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:paulserban.eu\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")