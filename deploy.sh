APP_NAME=openzwave-control-panel

echo "Building $APP_NAME image"
docker build -t $APP_NAME .

echo "Removing $APP_NAME container if it exists"
docker rm -f $APP_NAME

echo "Running $APP_NAME container"
docker run --rm --name $APP_NAME -p 8008:8008 \
    -v /dev/ttyACM0:/dev/zwave \
    --privileged \
    $APP_NAME

