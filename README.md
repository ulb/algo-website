# algo-website
Website for the algo group @ ULB

Build
```console
hugo
```

Serve locally
```console
hugo server
```

Upload
```console
rm -r public_html
mv public{,_html}
scp -r public_html/ aureooms@resu5.ulb.ac.be:/home/web1343/
```
