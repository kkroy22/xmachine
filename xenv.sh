GIT_REPO="$HOME/.config/appdata/xmachine"

XUR="tde"
CUR="$(whoami)"

if [ "$USER" != $XUR ]; then
    (cd $GIT_REPO && git pull && git submodule update --init --recursive)
fi

NIXPS1=$PS1

ROTC='\e[0;30;41m'
REGC='\e[0;30;42m'
SUDC='\e[0;30;43m'
OFFC='\e[0;97;100m'
DIRC='\e[30;104m'
ENDC='\e[0m'

ROTPS1="\[$ROTC\][\u]\[$ENDC\]-\[$DIRC\][\w]\[$ENDC\]\n\[$ROTC\]>\[$ENDC\]"
SUDPS1="\[$SUDC\][\u]\[$ENDC\]-\[$DIRC\][\w]\[$ENDC\]\n\[$SUDC\]>\[$ENDC\]"
REGPS1="\[$REGC\][\u]\[$ENDC\]-\[$DIRC\][\w]\[$ENDC\]\n\[$REGC\]>\[$ENDC\]"
OFFPS1="\[$OFFC\][\u]\[$ENDC\]-\[$DIRC\][\w]\[$ENDC\]\n\[$OFFC\]>\[$ENDC\]"

if [ "$CUR" = "root" ]; then
    PS1=$ROTPS1
elif [ "$CUR" = "bikky" ]; then
    PS1=$SUDPS1
elif [ "$CUR" = "compute" ]; then
    PS1=$REGPS1
elif [ "$CUR" = "kroy" ]; then
    PS1=$REGPS1
else
    PS1=$NIXPS1
fi


BXX=$HOME/.config/appdataARGO=$HOME/.cargo/bin
LXX=$HOME/.config/appdata/local_bin
BXX=$HOME/.config/appdata/xmachine/git_wkdir
SXX=$BXX/scripts
CXX=$BXX/target/release

LWM=$BXX/leftwm/target/release
RGP=$BXX/ripgrep/target/release
SXHKD=$HOME/.config/sxhkd/sxhkdrc

CARGO=$HOME/.cargo/bin

NODE=$HOME/.config/appdata/node/bin

NVIM=$HOME/.config/appdata/nvim/squashfs-root/usr/bin
JAVA_HOME=$HOME/.config/appdata/jdk
DBEAVER=$HOME/.config/appdata/dbeaver

PATH=$PATH:$CARGO:$LWM:$BXX:$SXX:$CXX:$LXX:$NODE:$NVIM:$RGP:$JAVA_HOME/bin:$DBEAVER

eval "$(starship init bash)"
alias vi="nvim"
alias vim="nvim"
alias co="vim Cargo.toml"
alias gg="git status"
