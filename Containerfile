FROM gentoo/stage3

RUN echo 'GENTOO_MIRRORS="https://ftp.lysator.liu.se/gentoo/"' >> /etc/portage/make.conf \
    && getuto

RUN cat <<EOF > /etc/portage/package.use/texlive
app-text/texlive cjk png truetype xml context extra graphics
app-text/texlive humanities luatex metapost pstricks publishers 
app-text/texlive science lex4ht xetex L10N: en ru el 
app-text/texlive-core cjk xetex
media-libs/harfbuzz icu
EOF

RUN emerge-webrsync && emerge -g -j5 texlive dev-tex/biblatex \
    && rm -rf /var/cache/distfiles && rm -rf /var/db/repos/gentoo

RUN echo 'media-fonts/corefonts MSttfEULA' > /etc/portage/package.license

RUN emerge-webrsync && emerge -g -j5 media-fonts/corefonts \
    && rm -rf /var/cache/distfiles && rm -rf /var/db/repos/gentoo
