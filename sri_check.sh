#!/bin/bash

# Display the SRI-Check message
echo ""
echo "o(*￣▽￣*)ブSRI-Check by ChiZu"
echo "------------------"

# Function to display usage information
usage() {
    echo "Usage: $0 -t <url>"
    exit 1
}

# Parse command line options
while getopts "t:" opt; do
    case ${opt} in
        t )
            target_url=$OPTARG
            ;;
        * )
            usage
            ;;
    esac
done

# Ensure the target URL is provided
if [ -z "$target_url" ]; then
    usage
fi

# Extract the domain from the target URL
domain=$(echo "$target_url" | awk -F/ '{print $3}')

# Fetch the HTML from the target site, extract JS URLs, filter external URLs, and check for SRI
curl -s "$target_url" | grep -oP 'https://[^"]+\.js' | grep -v "$domain" | while read -r js_url; do
    echo "Checking: $js_url"
    if curl -s "$js_url" | grep -qE 'integrity="[^"]+"'; then
        echo "SRI: In use"
    else
        echo "SRI: Not in use"
    fi
done
