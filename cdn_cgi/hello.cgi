#!/usr/bin/env python3

import cgi
import cgitb
cgitb.enable()

print("Content-Type: text/html\n")
print("<html><head>")
print("<title>Hello CGI</title>")
print("</head><body>")
print("<h1>Hello CGI!</h1>")
print("</body></html>")
