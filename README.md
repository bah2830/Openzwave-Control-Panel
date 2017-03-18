# OpenZwave Control Panel
Zwave control panel with patched build for allowing secure barrier devices.

Download the image
```
docker pull bah2830/openzwave-control-panel
```

Run the container
```
docker run --rm  \
		-p 8008:8008 \
        -e NETWORK_KEY="0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10" \
		-v /dev/ttyACM0:/dev/zwave \
		--privileged=true \
		bah2830/openzwave-control-panel
```

* Web interface: http://localhost:8008


## Building Locally
```
make deploy
```
