#!/bin/bash

# System tools
apt-get update
export DEBIAN_FRONTEND=noninteractive
apt-get install --yes --no-install-recommends parallel graphviz
rm -rf /var/lib/apt/lists/*

# Quality of life tooling
echo "alias ls='ls --color=auto'" >>/root/.profile
echo "alias ll='ls -alF'" >>/root/.profile
echo "alias ls='ls --color=auto'" >>/root/.zshrc
echo "alias ll='ls -alF'" >>/root/.zshrc
echo 'PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "' >>/root/.profile
echo 'PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"' >>/root/.profile

# The needed scripts for IAC CD operations
echo -e '#!/bin/bash\n/bin/terragrunt plan "$@"' >/usr/local/bin/iaccheck
echo -e '#!/bin/bash\n/bin/terragrunt apply "$@"' >/usr/local/bin/iacapply
echo -e '#!/bin/bash\n\nfind . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;' >/usr/local/bin/iacclean
chmod +x /usr/local/bin/iac*