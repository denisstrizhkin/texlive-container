FROM alpine:latest AS builder

RUN apk add --no-cache texlive-full biber pandoc

RUN apk add --no-cache fontconfig msttcorefonts-installer cabextract

RUN update-ms-fonts && \
    fc-cache -fv && \
    luaotfload-tool --update

RUN apk del msttcorefonts-installer cabextract && \
    rm -rf /tmp/* /var/cache/apk/* ~/.texlive*

FROM scratch

COPY --from=builder / /

CMD ["/bin/sh"]
