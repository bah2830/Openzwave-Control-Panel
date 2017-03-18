APP_NAME := openzwave-control-panel
HTTP_PORT := 8008

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
		--privileged=true \
		$(APP_NAME)
