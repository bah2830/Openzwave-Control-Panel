APP_NAME := openzwave-control-panel
HTTP_PORT := 8008

NETWORK_KEY ?= "0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10"

build:
	docker build -t $(APP_NAME) .

remove_container:
	-docker rm -f $(APP_NAME)

debug: build
	docker run -it --rm $(APP_NAME) bash

deploy: build remove_container
	docker run --rm --name $(APP_NAME) \
		-p $(HTTP_PORT):8008 \
		-v /dev/ttyACM0:/dev/zwave \
		-e NETWORK_KEY=$(NETWORK_KEY) \
		--privileged=true \
		$(APP_NAME)
