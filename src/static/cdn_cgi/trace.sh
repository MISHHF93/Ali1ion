#!/bin/bash

# Output content type for HTTP response
echo "Content-type: text/plain"
echo ""

# Output trace information
echo "Trace information:"

# Output server-related information
echo "Server Software: $SERVER_SOFTWARE"       # The server software being used (e.g., Apache, Nginx)
echo "Server Name: $SERVER_NAME"               # The server's hostname or IP address
echo "Server Protocol: $SERVER_PROTOCOL"       # The protocol used by the server (e.g., HTTP/1.1)
echo "Server Port: $SERVER_PORT"               # The port number the server is listening on

# Output request-related information
echo "Request Method: $REQUEST_METHOD"         # The HTTP method used (e.g., GET, POST)
echo "Request URI: $REQUEST_URI"               # The URI of the requested resource
echo "Script Name: $SCRIPT_NAME"               # The name of the script being executed

# Output client-related information
echo "Remote Address: $REMOTE_ADDR"            # The IP address of the client making the request
echo "Remote Port: $REMOTE_PORT"               # The port number used by the client
echo "User Agent: $HTTP_USER_AGENT"            # The User-Agent string provided by the client's browser
