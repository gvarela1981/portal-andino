## Instlar Andino en una DB externa al stack

## Configurar production.ini

editar el archivo insatll/db-ext/producion.ini

## Compilar la imagen

docker build -t datosgcba/portal-badata:release-2.6.3-db-ext .
docker-compose -f db-ext.yml up -d

/usr/lib/ckan/default/src/ckan/ckan/public/base/i18n/bg.js