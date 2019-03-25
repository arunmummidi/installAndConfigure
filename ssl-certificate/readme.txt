echo q | openssl s_client -connect example.com:443 | openssl x509 -noout -enddate -subject
