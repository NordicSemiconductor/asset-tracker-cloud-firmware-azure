FROM coderbyheart/fw-nrfconnect-nrf-docker:main@sha256:a86b2cb02ba8f70c4ba20a7490a96494f5a3ff01ebf8ddde3146405a51879ecc
RUN rm -rf /workdir/ncs
COPY . /workdir/ncs/firmware
RUN \
    # Zephyr requirements of firmware
    cd /workdir/ncs/firmware; west init -l && \
    cd /workdir/ncs; west update && \
    pip3 install -r zephyr/scripts/requirements.txt && \
    pip3 install -r nrf/scripts/requirements.txt && \
    pip3 install -r bootloader/mcuboot/scripts/requirements.txt && \
    rm -rf /workdir/ncs/firmware
# Optionally fetch the SUPL client
ARG SUPL_CLIENT_LIB_DOWNLOAD
RUN test -z "$SUPL_CLIENT_LIB_DOWNLOAD" || \
    /bin/bash -c "\
        apt-get -y install unzip && \
        wget -q $SUPL_CLIENT_LIB_DOWNLOAD -O supl_client.zip && \
        unzip supl_client.zip && \
        mkdir -p /workdir/ncs/nrf/ext/lib/bin && \
        mv -v supl /workdir/ncs/nrf/ext/lib/bin \
    " && :
