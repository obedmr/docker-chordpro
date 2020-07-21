FROM archlinux
MAINTAINER obed.n.munoz@gmail.com

RUN pacman -Syu --noconfirm perl-cpanplus make gcc ttf-ubuntu-font-family python-pip
RUN pip install awscli
RUN /usr/bin/vendor_perl/cpanp "s conf prereqs 1; s save"
RUN /usr/bin/vendor_perl/cpanp install chordpro
RUN curl -k https://raw.githubusercontent.com/pensnarik/consolas-font/master/Consolas-Regular.ttf -o /usr/share/fonts/Consolas.ttf
RUN pacman -Rsn  perl-cpanplus gcc --noconfirm ; pacman -Sc
ENV PATH $PATH:/usr/bin/site_perl/
