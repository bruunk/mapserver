#!/usr/bin/env bash

set -e
set -u

BAG_V11_DB_HOST=${BAG_V11_DB_HOST:-postgres-read.service.consul}
BAG_V11_DB_PORT=${BAG_V11_DB_PORT:-5432}
BAG_V11_DB_NAME=${BAG_V11_DB_NAME:-bag_v11}
BAG_V11_DB_USER=${BAG_V11_DB_USER:-${BAG_V11_DB_NAME}}
BAG_V11_DB_PASSWORD=${BAG_V11_DB_PASSWORD:-insecure}

NAP_DB_HOST=${NAP_DB_HOST:-postgres-read.service.consul}
NAP_DB_PORT=${NAP_DB_PORT:-5432}
NAP_DB_NAME=${NAP_DB_NAME:-nap}
NAP_DB_USER=${NAP_DB_USER:-${NAP_DB_NAME}}
NAP_DB_PASSWORD=${NAP_DB_PASSWORD:-insecure}

MILIEUTHEMAS_DB_HOST=${MILIEUTHEMAS_DB_HOST:-postgres-read.service.consul}
MILIEUTHEMAS_DB_PORT=${MILIEUTHEMAS_DB_PORT:-5432}
MILIEUTHEMAS_DB_NAME=${MILIEUTHEMAS_DB_NAME:-milieuthemas}
MILIEUTHEMAS_DB_USER=${MILIEUTHEMAS_DB_USER:-${MILIEUTHEMAS_DB_NAME}}
MILIEUTHEMAS_DB_PASSWORD=${MILIEUTHEMAS_DB_PASSWORD:-insecure}

PANORAMA_DB_HOST=${PANORAMA_DB_HOST:-postgres-read.service.consul}
PANORAMA_DB_PORT=${PANORAMA_DB_PORT:-5432}
PANORAMA_DB_NAME=${PANORAMA_DB_NAME:-panorama}
PANORAMA_DB_USER=${PANORAMA_DB_USER:-${PANORAMA_DB_NAME}}
PANORAMA_DB_PASSWORD=${PANORAMA_DB_PASSWORD:-insecure}

BASISKAART_DB_HOST=${BASISKAART_DB_HOST:-postgres-read.service.consul}
BASISKAART_DB_PORT=${BASISKAART_DB_PORT:-5432}
BASISKAART_DB_NAME=${BASISKAART_DB_NAME:-basiskaart}
BASISKAART_DB_USER=${BASISKAART_DB_USER:-${BASISKAART_DB_NAME}}
BASISKAART_DB_PASSWORD=${BASISKAART_DB_PASSWORD:-insecure}

HANDELSREGISTER_DB_HOST=${HANDELSREGISTER_DB_HOST:-postgres-read.service.consul}
HANDELSREGISTER_DB_PORT=${HANDELSREGISTER_DB_PORT:-5432}
HANDELSREGISTER_DB_NAME=${HANDELSREGISTER_DB_NAME:-handelsregister}
HANDELSREGISTER_DB_USER=${HANDELSREGISTER_DB_USER:-${HANDELSREGISTER_DB_NAME}}
HANDELSREGISTER_DB_PASSWORD=${HANDELSREGISTER_DB_PASSWORD:-insecure}

MONUMENTEN_DB_HOST=${MONUMENTEN_DB_HOST:-postgres-read.service.consul}
MONUMENTEN_DB_PORT=${MONUMENTEN_DB_PORT:-5432}
MONUMENTEN_DB_NAME=${MONUMENTEN_DB_NAME:-monumenten}
MONUMENTEN_DB_USER=${MONUMENTEN_DB_USER:-${MONUMENTEN_DB_NAME}}
MONUMENTEN_DB_PASSWORD=${MONUMENTEN_DB_PASSWORD:-insecure}

DATASELECTIE_DB_HOST=${DATASELECTIE_DB_HOST:-postgres-read.service.consul}
DATASELECTIE_DB_PORT=${DATASELECTIE_DB_PORT:-5432}
DATASELECTIE_DB_NAME=${DATASELECTIE_DB_NAME:-dataselectie}
DATASELECTIE_DB_USER=${DATASELECTIE_DB_USER:-${DATASELECTIE_DB_NAME}}
DATASELECTIE_DB_PASSWORD=${DATASELECTIE_DB_PASSWORD:-insecure}

VARIOUS_SMALL_DATASETS_DB_HOST=${VARIOUS_SMALL_DATASETS_DB_HOST:-postgres-read.service.consul}
VARIOUS_SMALL_DATASETS_DB_PORT=${VARIOUS_SMALL_DATASETS_DB_PORT:-5432}
VARIOUS_SMALL_DATASETS_DB_NAME=${VARIOUS_SMALL_DATASETS_DB_NAME:-various_small_datasets}
VARIOUS_SMALL_DATASETS_DB_USER=${VARIOUS_SMALL_DATASETS_DB_USER:-${VARIOUS_SMALL_DATASETS_DB_NAME}}
VARIOUS_SMALL_DATASETS_DB_PASSWORD=${VARIOUS_SMALL_DATASETS_DB_PASSWORD:-insecure}

DATASERVICES_DB_HOST=${DATASERVICES_DB_HOST:-postgres-read.service.consul}
DATASERVICES_DB_PORT=${DATASERVICES_DB_PORT:-5432}
DATASERVICES_DB_NAME=${DATASERVICES_DB_NAME:-dataservices}
DATASERVICES_DB_USER=${DATASERVICES_DB_USER:-${DATASERVICES_DB_NAME}}
DATASERVICES_DB_PASSWORD=${DATASERVICES_DB_PASSWORD:-insecure}

echo Creating configuration files

cat > /srv/mapserver/connection_bag.inc <<EOF
CONNECTIONTYPE postgis
CONNECTION "host=${BAG_V11_DB_HOST} dbname=${BAG_V11_DB_NAME} user=${BAG_V11_DB_USER} password=${BAG_V11_DB_PASSWORD} port=${BAG_V11_DB_PORT}"
PROCESSING "CLOSE_CONNECTION=DEFER"
EOF

cat > /srv/mapserver/connection_nap.inc <<EOF
CONNECTIONTYPE postgis
CONNECTION "host=${NAP_DB_HOST} dbname=${NAP_DB_NAME} user=${NAP_DB_USER} password=${NAP_DB_PASSWORD} port=${NAP_DB_PORT}"
PROCESSING "CLOSE_CONNECTION=DEFER"
EOF

cat > /srv/mapserver/connection_milieu.inc <<EOF
CONNECTIONTYPE postgis
CONNECTION "host=${MILIEUTHEMAS_DB_HOST} dbname=${MILIEUTHEMAS_DB_NAME} user=${MILIEUTHEMAS_DB_USER} password=${MILIEUTHEMAS_DB_PASSWORD} port=${MILIEUTHEMAS_DB_PORT}"
PROCESSING "CLOSE_CONNECTION=DEFER"
EOF

cat > /srv/mapserver/connection_panorama.inc <<EOF
CONNECTIONTYPE postgis
CONNECTION "host=${PANORAMA_DB_HOST} dbname=${PANORAMA_DB_NAME} user=${PANORAMA_DB_USER} password=${PANORAMA_DB_PASSWORD} port=${PANORAMA_DB_PORT}"
PROCESSING "CLOSE_CONNECTION=DEFER"
EOF

cat > /srv/mapserver/connection_monumenten.inc <<EOF
CONNECTIONTYPE postgis
CONNECTION "host=${MONUMENTEN_DB_HOST} dbname=${MONUMENTEN_DB_NAME} user=${MONUMENTEN_DB_USER} password=${MONUMENTEN_DB_PASSWORD} port=${MONUMENTEN_DB_PORT}"
PROCESSING "CLOSE_CONNECTION=DEFER"
EOF

cat > /srv/mapserver/connection_basiskaart.inc <<EOF
CONNECTIONTYPE postgis
CONNECTION "host=${BASISKAART_DB_HOST} dbname=${BASISKAART_DB_NAME} user=${BASISKAART_DB_USER} password=${BASISKAART_DB_PASSWORD} port=${BASISKAART_DB_PORT}"
PROCESSING "CLOSE_CONNECTION=DEFER"
EOF

cat > /srv/mapserver/connection_handelsregister.inc <<EOF
CONNECTIONTYPE postgis
CONNECTION "host=${HANDELSREGISTER_DB_HOST} dbname=${HANDELSREGISTER_DB_NAME} user=${HANDELSREGISTER_DB_USER} password=${HANDELSREGISTER_DB_PASSWORD} port=${HANDELSREGISTER_DB_PORT}"
PROCESSING "CLOSE_CONNECTION=DEFER"
EOF

cat > /srv/mapserver/connection_dataselectie.inc <<EOF
CONNECTIONTYPE postgis
CONNECTION "host=${DATASELECTIE_DB_HOST} dbname=${DATASELECTIE_DB_NAME} user=${DATASELECTIE_DB_USER} password=${DATASELECTIE_DB_PASSWORD} port=${DATASELECTIE_DB_PORT}"
PROCESSING "CLOSE_CONNECTION=DEFER"
EOF

cat > /srv/mapserver/connection_various_small_datasets.inc <<EOF
CONNECTIONTYPE postgis
CONNECTION "host=${VARIOUS_SMALL_DATASETS_DB_HOST} dbname=${VARIOUS_SMALL_DATASETS_DB_NAME} user=${VARIOUS_SMALL_DATASETS_DB_USER} password=${VARIOUS_SMALL_DATASETS_DB_PASSWORD} port=${VARIOUS_SMALL_DATASETS_DB_PORT}"
PROCESSING "CLOSE_CONNECTION=DEFER"
EOF

cat > /srv/mapserver/connection_dataservices.inc <<EOF
CONNECTIONTYPE postgis
CONNECTION "host=${DATASERVICES_DB_HOST} dbname=${DATASERVICES_DB_NAME} user=${DATASERVICES_DB_USER} password=${DATASERVICES_DB_PASSWORD} port=${DATASERVICES_DB_PORT}"
PROCESSING "CLOSE_CONNECTION=DEFER"
EOF

# Configure apache to redirect errors to stderr.
# The mapserver will redirect errors to apache errorstream (see header.inc and private/header.inc)
# and apache will then redirect this to stderr, which will then be redirected to syslog/kibana.
# ref: http://mapserver.org/optimization/debugging.html#steps-to-enable-mapserver-debugging
#      https://serverfault.com/questions/711168/writing-apache2-logs-to-stdout-stderr
sed -i 's/ErrorLog .*/ErrorLog \/dev\/stderr/' /etc/apache2/apache2.conf
sed -i 's/Timeout 300/Timeout 600/' /etc/apache2/apache2.conf

# Replace actual location of the mapserver depending on the environment
sed -i 's#MAP_URL_REPLACE#'"$MAP_URL"'#g' /srv/mapserver/topografie.map /srv/mapserver/topografie_wm.map
sed -i 's#LEGEND_URL_REPLACE#'"$LEGEND_URL"'#g' /srv/mapserver/topografie.map /srv/mapserver/topografie_wm.map

mkdir -p /srv/mapserver/config
# python3 /srv/mapserver/tools/make_mapfile_config.py > /srv/mapserver/sld/config.json

echo Starting server
# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid
apachectl -D FOREGROUND
