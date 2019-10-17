# algo-website
Website for the algo group @ ULB

#### Technology

This website uses a combination of

  - [hugo](https://gohugo.io) for static website generation
  - [bootstrap](https://getbootstrap.com) for CSS styling
  - [jQuery](https://jquery.com) for JavaScript scripting
  - [IPFS](https://ipfs.io) to serve images

... and some other stylesheets, scripts, and fonts found in the
[theme folder](https://github.com/ulb/algo-website/tree/master/themes/hugo-creative-portfolio-theme/static).

#### In Short

If you want to edit the content: edit the file `config.yml`, and the folders
`/static` and `/content`.

If you want to edit the layout of the pages,
fiddle with the theme (`/themes/hugo-creative-portfolio-theme`).

##### A note on images

Images can be stored in `/static` instead of using IPFS. Path to images can
then be expressed relatively to the website root (`/path/to/image`).
However this has the drawback of bloating the git repo and the storage on ULB's
server.

The alternative is to first point to an existing image on the interwebz and
then later to store a copy of it on our IPFS node on the beast and update the
link.

#### Update

##### Add yourself

 1. Add your details to
[the config file](https://github.com/aureooms-ulb/algo-website/blob/master/config.yml).

 2. In your pull request, give a link to a picture of yourself.

##### Deploy to https://algo.ulb.be

This requires the user `username` to have write permissions to `resu5.ulb.ac.be:/home/web1343`.

```console
make deploy DEPLOYER=username
```

#### Develop on local machine

##### Build
```console
make build
```

##### Serve locally
```console
make serv
```

##### Optimize images

> /!\ ONLY IF YOU UNDERSTAND WHAT YOU ARE DOING

```console
make optimize
```

##### Pin images

> /!\ ONLY IF YOU UNDERSTAND WHAT YOU ARE DOING

```console
make pin
```
