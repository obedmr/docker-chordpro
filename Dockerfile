FROM archlinux
MAINTAINER obed.n.munoz@gmail.com

# WORKAROUND for glibc 2.33 and old Docker
# See https://github.com/actions/virtual-environments/issues/2658
# Thanks to https://github.com/lxqt/lxqt-panel/pull/1562
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
    bsdtar -C / -xvf "$patched_glibc"
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm perl-cpanplus make gcc ttf-ubuntu-font-family python-pip go git
RUN pip install awscli
RUN /usr/bin/vendor_perl/cpanp "s conf prereqs 1; s save"
RUN /usr/bin/vendor_perl/cpanp install chordpro
RUN curl -k https://raw.githubusercontent.com/pensnarik/consolas-font/master/Consolas-Regular.ttf -o /usr/share/fonts/Consolas.ttf
RUN pacman -Rsn  perl-cpanplus gcc --noconfirm ; pacman -Sc
ENV PATH $PATH:/usr/bin/site_perl/
