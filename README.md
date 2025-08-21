# TESTING IMAGE

For testing purposes.

This image is hosted as waazaafr/soulsync:beta but if you want to make yours:

```bash
git clone https://github.com/waazaa-fr/docker-soulsync.git .
docker build --no-cache -t soulsync .
```

And run it:
```bash
mkdir -pm 0777 app/
docker run -d --name soulsync -p 5800:5800 -p 5900:5900 -v ./app:/soulsync waazaafr/soulsync:beta
```

Or with yours:
```bash
mkdir -pm 0777 app/
docker run -d --name soulsync -p 5800:5800 -p 5900:5900 -v ./app:/soulsync soulsync
```


### Credits goes to jlesage for his image 
jlesage/baseimage-gui:ubuntu-22.04-v4 used as base image.