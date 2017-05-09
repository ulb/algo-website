# algo-website
Website for the algo group @ ULB

##### Add yourself

 1. Add your details to
[the config file](https://github.com/aureooms-ulb/algo-website/blob/master/config.yml).

 2. Add your picture to
[team](https://github.com/aureooms-ulb/algo-website/tree/master/static/img/team)
or
[alumni](https://github.com/aureooms-ulb/algo-website/tree/master/static/img/alumni).

##### Build
```console
hugo
```

##### Serve locally
```console
hugo server
```

##### Upload
```console
rm -r public_html
mv public{,_html}
scp -r public_html/ aureooms@resu5.ulb.ac.be:/home/web1343/
```
