FROM archlinux
MAINTAINER obed.n.munoz@gmail.com

RUN pacman -Syu --noconfirm perl-cpanplus make gcc
RUN /usr/bin/vendor_perl/cpanp "s conf prereqs 1; s save"
RUN /usr/bin/vendor_perl/cpanp install chordpro
RUN pacman -Rsn  perl-cpanplus gcc --noconfirm ; pacman -Sc
ENV PATH $PATH:/usr/bin/site_perl/