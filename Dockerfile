FROM pataquets/vim

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      curl \
      exuberant-ctags \
  && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y --no-install-recommends install \
      git-core \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

RUN \
  curl http://j.mp/spf13-vim3 -L -o - | sh
