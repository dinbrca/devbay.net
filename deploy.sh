#!/usr/bin/env bash

# GZIP files.
find dist -type f \( -iname '*.xml' -or -iname '*.txt' -or -iname '*.css' -or -iname '*.js' -or -iname '*.html' \) -exec gzip "{}" \; -exec mv "{}.gz" "{}" \;

# CSS (Cache: 365 days)
s3cmd sync --acl-public --exclude '*.*' --include '*.css' -m "text/css" --add-header="Cache-Control: max-age=31536000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" dist/css/ s3://devbay.net/css/

# JS (Cache: 365 days)
s3cmd sync --acl-public --exclude '*.*' --include '*.js' -m "application/javascript" --add-header="Cache-Control: max-age=31536000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" dist/js/ s3://devbay.net/js/

# HTML (Cache: 30 days)
s3cmd sync --acl-public --exclude '*.*' --include  '*.html' -m "text/html" --add-header="Cache-Control: max-age=2592000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" dist/ s3://devbay.net/

# XML (Cache: 30 days)
s3cmd sync --acl-public --exclude '*.*' --include  '*.xml' -m "application/xml" --add-header="Cache-Control: max-age=2592000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" dist/ s3://devbay.net/

# Robots.txt (Cache: 30 days)
s3cmd sync --acl-public --exclude '*.*' --include 'robots.txt' -m "text/plain" --add-header="Cache-Control: max-age=2592000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" dist/ s3://devbay.net/

# PNG (Cache: 30 days)
s3cmd sync --acl-public --exclude '*.*' --include '*.png' -m "image/png" --add-header="Cache-Control: max-age=2592000" dist/ s3://devbay.net/

# JPG (Cache: 30 days)
s3cmd sync --acl-public --exclude '*.*' --include '*.jpg' -m "image/jpg" --add-header="Cache-Control: max-age=2592000" dist/ s3://devbay.net/

# ICO (Cache: 30 days)
s3cmd sync --acl-public --exclude '*.*' --include '*.ico' -m "image/vnd.microsoft.icon" --add-header="Cache-Control: max-age=2592000" dist/ s3://devbay.net/

# Sync: remaining files & delete removed
s3cmd sync --acl-public --delete-removed  dist/ s3://devbay.net/
