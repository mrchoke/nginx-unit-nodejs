# nginx-unit-nodejs
#Demo app for Nginx Unit NodeJs

* Nginx-Unit 1.8.0
* NodeJs 11.10.1

# USE

```
docker run -it -d  --name unit -p 3000:3000  mrchoke/unit:1.8.0-nodejs-11.10.1.2

```

OR 

```
git clone https://github.com/mrchoke/nginx-unit-nodejs

cd nginx-unit-nodejs

```
edit your app

```
docker run -it -d  -v $PWD/app:/srv/app  --name unit -p 3000:3000 mrchoke/unit:1.8.0-nodejs-11.10.1.2

```

OR 

```
git clone https://github.com/mrchoke/nginx-unit-nodejs

cd nginx-unit-nodejs

```
Edit your app

```
docker build -t yourimage:tag  .

docker run -it -d  --name unit -p 3000:3000   yourimage:tag

```

## Docker REPO

```
 https://hub.docker.com/r/mrchoke/unit
```
