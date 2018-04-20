FROM pataquets/vim

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      curl \
      exuberant-ctags \
      vim-nox \
  && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y --no-install-recommends install \
      git-core \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

RUN \
  curl http://j.mp/spf13-vim3 -L -o - | sh \
  && \
  mkdir -vp /src/ && \
  sed -i 's/amirh\/HTML-AutoCloseTag/vim-scripts\/HTML-AutoCloseTag/g' \
    /root/.vimrc.bundles && \
  grep "vim-scripts/HTML-AutoCloseTag" /root/.vimrc.bundles && \
  vim "+set nomore" "+BundleInstall!" "+BundleClean" "+qall"

ENTRYPOINT [ "vim" ]
CMD [ "/src/" ]
