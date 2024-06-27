FROM debian:buster


WORKDIR /tmp
COPY fme-desktop-2021_2021.2.3.21812~debian.10_amd64.deb fme.deb

RUN apt update

# these packages do not install _well_ with --fix-broken
RUN apt install --yes \
        openjdk-11-jre-headless \
        ca-certificates-java

# fme installation will fail due to unmet dependencies
#   return true to preventing halting Docker build
RUN dpkg --install /tmp/fme.deb || true
RUN apt --fix-broken --yes install \
        && apt clean \
        && apt remove \
        && apt --yes autoremove
RUN rm /tmp/fme.deb

# fme will not run as root
RUN useradd -ms /bin/bash ufme

USER ufme
CMD /opt/fme-desktop-2021/bin/fmeworkbench

