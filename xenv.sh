GIT_REPO="$HOME/.config/appdata/xmachine"

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


BXX=$HOME/.config/appdata
GXX=$BXX/xmachine/git_wkdir

LXX=$BXX/local_bin
CARGO=$HOME/.cargo/bin
CXX=$GXX/target/release
SXX=$GXX/scripts

SXHKD=$HOME/.config/sxhkd/sxhkdrc
NVIM=$HOME/.config/appdata/nvim/squashfs-root/usr/bin
NODE=$HOME/.config/appdata/node/bin

SHP=$GXX/starship/target/release
LWM=$GXX/leftwm/target/release
RGP=$GXX/ripgrep/target/release
OOT=$GXX/broot/target/release

CODE=$HOME/.config/appdata/vscode
GKRN=$HOME/.config/appdata/gitkraken

PATH=$PATH:$LXX:$CARGO:$CXX:$SXX:$SXHKD:$NVIM:$NODE:$SHP:$LWM:$RGP:$OOT:$CODE:$GKRN

eval "$(starship init bash)"
alias vi="nvim"
alias vim="nvim"
alias gg="cd $GIT_REPO"
