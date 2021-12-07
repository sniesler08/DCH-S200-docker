# DCH-S200-web-control image
# OKAY 1

[Docker container for DCH-S200-web-control](https://github.com/mtflud/DCH-S220-Web-Control/)

## Build

1. Install npm modules: `cd webcontrol; npm i`
2. Build docker image: `docker build -t dcg-s200-web-control .`


## Run

```
docker run \
  -p 9867:5000 \
  -e SIREN_PASSWORD=123456 \
  -e SIREN_IP_ADDRESS=siren.local \
  -e  WEBHOOK_USERNAME=admin \
  -e WEBHOOK_PASSWORD=pass \
  -e WEBHOOK_PORT=5000 \
  dcg-s200-web-control
```

## Test

This command
```
curl \
 -u admin:pass \
 "http://127.0.0.1:9867/?type=status"
```

Should return:
```
{"status":"OK","message":"Successfully processed","isPlaying":false}
```
