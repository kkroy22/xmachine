BXX=$HOME/.config/appdata
GXX=$BXX/xmachine/git_wkdir
GIT_REPO=$BXX/xmachine

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



LXX=$BXX/local_bin
CXX=$GXX/target/release
SXX=$GXX/scripts
CARGO=$HOME/.cargo/bin

NVIM=$HOME/.config/appdata/nvim/bin
NODE=$HOME/.config/appdata/node/bin
GOLAN=$HOME/.config/appdata/golang/bin

SXHKD=$HOME/.config/sxhkd/sxhkdrc
SHP=$GXX/starship/target/release
LWM=$GXX/leftwm/target/release
RGP=$GXX/ripgrep/target/release
GITUI=$GXX/gitui/target/release

PATH=$PATH:$BXX:$CXX:$SXX:$CARGO:$NVIM:$NODE:$GOLAN:$SXHKD:$SHP:$LWM:$RGP:$GITUI

eval "$(starship init bash)"
alias vi="nvim"
alias vim="nvim"
alias gg="cd $GIT_REPO"
export _JAVA_AWT_WM_NONREPARENTING=1

export XSECURELOCK_NO_COMPOSITE=1
export XSECURELOCK_DISCARD_FIRST_KEYPRESS=0
export XSECURELOCK_PASSWORD_PROMPT=disco 
export XSECURELOCK_SHOW_DATETIME=1
export XSECURELOCK_SINGLE_AUTH_WINDOW=1
export XSECURELOCK_AUTH_TIMEOUT=30
