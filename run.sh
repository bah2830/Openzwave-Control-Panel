# Set the network key if supplied
if [ -n "$NETWORK_KEY" ]; then
    sed -i 's/\(NetworkKey" value="\).*/\1'"$NETWORK_KEY"'" \/>/g' /app/Openzwave-control-panel/config/options.xml
fi

# Run openzwave control panel
cd /app/Openzwave-control-panel
./ozwcp -p 8008