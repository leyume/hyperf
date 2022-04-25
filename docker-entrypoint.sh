#!/bin/sh
set -e

composer install

echo "Night gathers, and now my watch begins."
php /usr/bin/watch.php
# php /app/index.php start