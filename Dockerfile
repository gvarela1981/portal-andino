# Si se lleva a cabo un docker build de portal-andino sin el parámetro "--build-arg IMAGE_VERSION={versión de portal-base}, se usa el ARG IMAGE_VERSION por default
ARG IMAGE_VERSION=release-2.6.3


FROM datosgobar/portal-andino:$IMAGE_VERSION
MAINTAINER Gonzalo Varela<gonzalo.varela1981@gmail.com>

WORKDIR /portal

# portal-andino-theme
RUN . /usr/lib/ckan/default/bin/activate
RUN $CKAN_HOME/bin/pip install -e git+https://github.com/datosgcba/ckanext-gcbaandinotheme.git@9fb3077af30c91a5f1223b92ea1a50bcb085a9a7#egg=ckanext-gcbaandinotheme

COPY install/db-ext/i18ln/* /usr/lib/ckan/default/src/ckan/ckan/public/base/i18n/
COPY install/db-ext/init.sh /etc/ckan_init.d/init.sh
COPY install/db-ext/production.ini /etc/ckan/default/production.ini 
