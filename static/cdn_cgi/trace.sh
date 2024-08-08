#!/bin/bash
echo "Content-type: text/plain"
echo ""
echo "Trace information:"
echo "Server Software: $SERVER_SOFTWARE"
echo "Server Name: $SERVER_NAME"
echo "Server Protocol: $SERVER_PROTOCOL"
echo "Server Port: $SERVER_PORT"
echo "Request Method: $REQUEST_METHOD"
echo "Request URI: $REQUEST_URI"
echo "Script Name: $SCRIPT_NAME"
echo "Remote Address: $REMOTE_ADDR"
echo "Remote Port: $REMOTE_PORT"
echo "User Agent: $HTTP_USER_AGENT"
