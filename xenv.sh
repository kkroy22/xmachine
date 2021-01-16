GIT_REPO="$HOME/Downloads/appdata/xrice"

XUR="kroy"
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


CARGO=$HOME/.cargo/bin
SXX=$HOME/.config/appdata/xmachine/scripts
BXX=$HOME/.config/appdata/localbin
NVIM=$HOME/.config/appdata/neovim
NODE=$HOME/.config/appdata/node/bin
YDL=$HOME/.config/appdata/youtube-dl

PATH=$PATH:$SXX:$BXX:$CARGO:$NVIM:$NODE:$YD
