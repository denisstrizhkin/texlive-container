FROM gentoo/stage3

RUN emerge-webrsync && emerge --sync
RUN emerge getuto && getuto
RUN emerge -g mirrorselect && mirrorselect -s3 -b10 -D -R Europe

RUN rmdir /etc/portage/package.use

RUN echo 'app-text/texlive cjk png truetype xml context extra graphics' \
'humanities luatex metapost pstricks publishers' \
'science lex4ht xetex L10N: en ru el' > /etc/portage/package.use \
&& echo 'app-text/texlive-core cjk xetex' >> /etc/portage/package.use \
&& echo 'media-libs/harfbuzz icu' >> /etc/portage/package.use

RUN emerge -g -j5 texlive
RUN emerge -g -j5 dev-tex/biblatex

RUN echo 'media-fonts/corefonts MSttfEULA' > /etc/portage/package.license
RUN emerge -g -j5 media-fonts/corefonts

RUN rm -rf /var/cache/distfiles
