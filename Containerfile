FROM gentoo/stage3

RUN cat <<EOF > /etc/portage/package.use/texlive
app-text/texlive cjk png truetype xml context extra graphics
app-text/texlive humanities luatex metapost pstricks publishers 
app-text/texlive science lex4ht xetex L10N: en ru el 
app-text/texlive-core cjk xetex
media-libs/harfbuzz icu
EOF

# Fix for QEMU/Binfmt PTY issues
ENV TERM=dumb
ENV FEATURES="-binpkg-logs -ipc-sandbox -pid-sandbox -network-sandbox -usersandbox"

RUN echo 'media-fonts/corefonts MSttfEULA' > /etc/portage/package.license

RUN getuto && \
    emerge-webrsync && \
    emerge -g -j5 \
    texlive \
    dev-tex/biblatex \
    media-fonts/corefonts \
    app-text/pandoc-bin && \
    rm -rf /var/cache/distfiles/* && \
    rm -rf /var/db/repos/gentoo
