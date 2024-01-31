ARG UPGRADE_FROM_VERSION

FROM postgres:${UPGRADE_FROM_VERSION}

# ARG's are scoped, so we need to put this after "FROM"
ARG UPGRADE_TO_VERSION

RUN echo "Installing postgres version ${UPGRADE_TO_VERSION}" \
    && apt-get update \
    && apt-get install -y --no-install-recommends "postgresql-${UPGRADE_TO_VERSION}" \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
