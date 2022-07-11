alias cls="clear"
alias c="clear"
alias lsize="ls --human-readable --size -1 -S --classify"

# go up in directories with dots
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# go up in directories with numbers
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias ..1="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# windows-like cd
alias cd..="cd .."

# lists all elements (including hidden dir/files, excluding . and ..)
alias la="ls -A"

# lists all elements, one per line
alias l1="ls -A1"

# lists all elements with more info
alias ll="ls -Alh"

# see commands history
alias h="history"

# apt install
alias install="sudo apt install"

# apt update
alias update="sudo apt update && sudo apt upgrade"

# apt remove
alias remove="sudo apt --purge remove"

alias autoclean="sudo apt autoclean"

alias autoremove="sudo apt autoremove"

# lists all packages installed
alias lpkg="dpkg --list"

# lists all running processes
alias lpc="ps aux"

# get specific process from list
alias lpcn="ps aux | grep -i"

# kill process
alias kpc="sudo kill -9"

# opens file with default application
alias open="xdg-open"

# calculator
alias calc="bc -l"

# TODO
alias ports="netstat -tulanp"

# checks if trash is empty;
# if not, lists files in trash
# note: gives info about number of files
# and total size
ltrash() {
    if [[ $(ls ~/.local/share/Trash/files) ]]; then

        n_files=$(ls ~/.local/share/Trash/files | wc -l)
        total_size=$(du -hs ~/.local/share/Trash/files | cut -f1)

        if test $n_files -eq 1; then
            text="file"
        else
            text="files"
        fi

        # echos in BOLD
        echo -e "\033[1m$n_files $text, ${total_size}B total size:\033[0m"
        ls ~/.local/share/Trash/files
    else
        echo "trash is empty..."
    fi
}

# checks if trash is empty;
# if not, clears it and tells the user
# note: gives info about total number of files deleted
# and total size cleaned
ctrash() {
    if [[ $(ls ~/.local/share/Trash/files) ]]; then

        n_files=$(ls ~/.local/share/Trash/files | wc -l)
        total_size=$(du -hs ~/.local/share/Trash/files | cut -f1)

        if test $n_files -eq 1; then
            text="file"
        else
            text="files"
        fi

        rm -rf ~/.local/share/Trash/files/*
        echo "trash is now empty..."

        # echos in BOLD
        echo -e "\033[1m$n_files $text deleted, cleaned ${total_size}B\033[0m"
    else
        echo "trash is already empty..."
    fi
}

# trash file
alias trash="gio trash"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
# alias rm='rm -i'

alias reboot="sudo /sbin/reboot"
alias off="sudo /sbin/poweroff"
# alias halt="sudo /sbin/halt"
alias suspend="systemctl suspend"
# alias shutdown="sudo /sbin/shutdown"

# to quit bash
alias :q="exit"
alias :Q="exit"
alias xt="exit"
alias bye="exit"
alias quit="exit"

# adds row number to nano
alias nano="nano -l"

# unzip files
alias untar="tar -zxvf"

# git commands
alias gs="git status"
alias ga="git add"
alias gcl="git clone"
alias gc="git commit -m"
alias gp="git push -u origin main"
alias gf="git fetch"
alias gfa="git fetch --all"

alias refresh="source ~/.bash_aliases"

# empties file or dir
empty() {
    PASSED="$1"

    # if dir, removes everything that's inside it but itself
    if test -d "$(pwd)/$PASSED" ; then
        
        if [ `ls $PASSED | wc -l` -gt 0 ]; then
            rm -rfv $PASSED/*
            echo -e "\033[1mdirectory emptied...\033[0m"
        else
            echo -e "\033[1mdirectory is already empty...\033[0m"
        fi
    elif test -f $PASSED ; then
        > $PASSED
        echo -e "\033[1mfile emptied...\033[0m"
    else
        echo "$PASSED is not valid"
    fi

}

# creates a file and gives all permissions
cr() {
    touch $1
    chmod +rwx $1
}

# changes directory and immediately lists all files and dirs
cdl() {
    cd $1
    la
}

alias mka="mkdir -pv"

# creates a directory and cds into it
mkcd () {
  mkdir -p -- "$1" && cd -P -- "$1"
}

# create repo on github using MVC design pattern
mvcrepo() {
    NAME=$1
    gh repo create $NAME
    git clone git@github.com:seve-andre/$NAME.git
    cd $NAME
    echo "# $NAME" >> README.md
    mkdir src
    mkdir test
    cd src
    mkdir model
    mkdir view
    mkdir controller
    cd ..
    git add .
    git commit -m "initial commit"
    git branch -M main
    git remote set-url origin git@github.com:seve-andre/$NAME.git
    git push -u origin main
}

# creates simple repo with README only
srepo() {
    NAME=$1
    gh repo create $NAME
    git clone git@github.com:seve-andre/$NAME.git $NAME
    cd $NAME
    echo "# $NAME" >> README.md
    git add README.md
    git commit -m "initial commit"
    git branch -M main
    git remote set-url origin git@github.com:seve-andre/$NAME.git
    git push -u origin main
}

jfx() {
    NAME=$1
    git clone git@github.com:seve-andre/sample-javafx-project.git $NAME
}

# enables ctrl+tab && ctrl+shift+tab for switching tabs in terminal
# gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
# gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'

# systemd-analyze
