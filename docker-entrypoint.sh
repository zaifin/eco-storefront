#!/bin/sh
# docker-entrypoint.sh

echo "Starting storefront with API URL: $NEXT_PUBLIC_API_URI"

exec npm start
