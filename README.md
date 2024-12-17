# sri_check.sh

**Sri_checker is a tool designed to identify embedded links in a webpage's source code that are missing Subresource Integrity (SRI).** 

SRI is an essential security feature to ensure the integrity and authenticity of external resources (e.g., scripts and stylesheets). 
This tool scans the HTML code and helps developers quickly locate resources without proper SRI attributes, improving website security.

usage:
```
chmod +x sri_check.sh

./sri_check.sh -t <target-url>
```
