FROM debian:bookworm-slim AS build
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get --allow-releaseinfo-change update
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gcc ninja-build
RUN apt-get install -y --no-install-recommends curl wget git ca-certificates
WORKDIR /tmp
RUN git clone https://github.com/corsix/polyfill-glibc.git && \
    cd polyfill-glibc && \
    ninja polyfill-glibc

FROM debian:bookworm-slim
COPY --from=build /tmp/polyfill-glibc/polyfill-glibc /usr/local/bin/polyfill-glibc
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
