echo q | openssl s_client -connect pdb.id.rakuten.co.jp:443 | openssl x509 -noout -enddate -subject
