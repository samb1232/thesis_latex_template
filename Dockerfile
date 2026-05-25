FROM texlive/texlive:latest

ENV DEBIAN_FRONTEND=noninteractive

# Adds Debian contrib/non-free repos
RUN set -eux; \
    . /etc/os-release; \
    if [ -f /etc/apt/sources.list.d/debian.sources ]; then \
      sed -i 's/Components: main/Components: main contrib non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources; \
    elif [ -f /etc/apt/sources.list ]; then \
      sed -i 's/ main$/ main contrib non-free non-free-firmware/g' /etc/apt/sources.list; \
    fi

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

# Installs:
# - Times New Roman from ttf-mscorefonts-installer;
# - TeX Gyre Termes Math from unicode-math;
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      fontconfig \
      cabextract \
      xfonts-utils \
      ttf-mscorefonts-installer \
      fonts-texgyre \
      fonts-texgyre-math \
      fonts-lmodern \
      fonts-stix; \
    fc-cache -f -v; \
    rm -rf /var/lib/apt/lists/*

# test fonts
RUN fc-match "Times New Roman" && \
    fc-match "TeX Gyre Termes Math"
