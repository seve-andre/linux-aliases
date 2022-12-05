if status is-interactive
    # Commands to run in interactive sessions can go here
end

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
function ltrash -d "Lists file in trash"
    set n_files (ls ~/.local/share/Trash/files | wc -l)

    if test $n_files -gt 0
        set total_size (du -hs ~/.local/share/Trash/files | cut -f1)

        if test $n_files -eq 1
            set text "file"
        else
            set text "files"
        end

        # echos in BOLD
        echo -e "\033[1m"$n_files $text, $total_size"B" total size:"\033[0m"
        ls ~/.local/share/Trash/files
    else
        echo "trash is empty..."
    end
end

# checks if trash is empty;
# if not, clears it and tells the user
# note: gives info about total number of files deleted
# and total size cleaned
function ctrash -d "Clears trash if non empty"
    set n_files (ls ~/.local/share/Trash/files | wc -l)

    if test $n_files -gt 0
        set total_size (du -hs ~/.local/share/Trash/files | cut -f1)

        if test $n_files -eq 1
            set text "file"
        else
            set text "files"
        end

        rm -rf ~/.local/share/Trash/files/*
        echo "trash is now empty..."
        # echos in BOLD
        # "\033[1m$n_files $text deleted, cleaned ${total_size}B\033[0m"

        echo -e "\033[1m"$n_files $text deleted, cleaned $total_size"B\033[0m"
    else
        echo "trash is empty..."
    end
end

# trash file
alias trash="gio trash"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
# alias rm='rm -i'

alias reboot="sudo /sbin/reboot"
alias restart="sudo /sbin/reboot"
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

alias refresh="source ~/.config/fish/config.fish"

# creates a file and gives all permissions
function cr -d "Creates file giving all permissions"
    touch $argv[1]
    chmod +rwx $argv[1]
end

# # changes directory and immediately lists all files and dirs
function cdl -d "Changes directory and lists all files and dirs in it"
    cd $argv[1]
    la
end

alias mka="mkdir -pv"

# # creates a directory and cds into it
function mkcd -d "Creates a dir and cds into it"
  mkdir $argv[1] && cd $argv[1]
end

# creates private repo with README only
function new-priv-repo -d "Creates a private repo on GitHub at seve-andre"
    set NAME $argv[1]
    gh repo create $NAME --private
    git clone git@github.com:seve-andre/$NAME.git $NAME
    cd $NAME
    echo "# $NAME" >> README.md
    git add README.md
    git commit -m "initial commit"
    git branch -M main
    git remote set-url origin git@github.com:seve-andre/$NAME.git
    git push -u origin main
end

# # creates public repo with README only
function new-pub-repo -d "Creates a public repo on GitHub at seve-andre"
    set NAME $argv[1]
    gh repo create $NAME --public
    git clone git@github.com:seve-andre/$NAME.git $NAME
    cd $NAME
    echo "# $NAME" >> README.md
    git add README.md
    git commit -m "initial commit"
    git branch -M main
    git remote set-url origin git@github.com:seve-andre/$NAME.git
    git push -u origin main
end

# enables ctrl+tab && ctrl+shift+tab for switching tabs in terminal
# gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
# gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'

# systemd-analyze
alias code="flatpak run com.visualstudio.code"
