#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# faster text editing potential
alias vi='nvim'

# nice colorizing
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# vimy bash exiting
alias :q='exit'
alias :wq='exit'

# tar help
alias tar-unzip='tar -xvzf'

# update pacman mirrors
# NOTE: this command assumes you changed your mirror list to a file called
# `newmirrorlist` in `/etc/pacman.d/`. This is nice because it keeps the
# original mirror list as a backup.
alias pacman-update-mirrors='sudo reflector --verbose -c "United States" --latest 5 --age 12 --protocol http,https --sort rate --save /etc/pacman.d/newmirrorlist'

# git aliases to easily uncommit and recommit changes (while keeping local
# changes in the files)
git() {
    if [[ $@ == "uncommit" ]]; then
        command git reset HEAD~1
    elif [[ $@ == "recommit" ]]; then
        command git reset ORIG_HEAD
        # can also do `git reset 'HEAD@{n}'` where `n` is number of commits
    else
        command git "$@"
    fi
}

# get wezterm undercurl after following these steps:
# https://wezfurlong.org/wezterm/faq.html?highlight=undercur#how-do-i-enable-undercurl-curly-underlines
if [[ $TERM_PROGRAM == "WezTerm" ]]; then
    export TERM="wezterm"
fi

# *two different cool `PS1` prompts* 
# NOTE: on Konsole with transparent background the parts of the prompts that
# share the same color as the background color (if any, determined by color
# scheme) will also be transparent. workaround is only to disable transparency
# or change that base color of the scheme (usually 0) to, say, 1 value off of
# the original. hacky but works.

# PS1='\[\033[32m\]╭\[\033[40m\]┨\[\033[37m\]\[\033[40m\] \u <=> \w \[\033[32m\]┃\[\033[00m\]\n\[\033[32m\]╰─►\[\033[00m\]\$ \[\033[00m\]'
PS1='\[\033[32m\]╭\[\033[40m\]┨\[\033[37m\]\[\033[40m\]  \u \[\033[30m\]\[\033[42m\] \w \[\033[00m\]\[\033[32m\]\n\[\033[32m\]╰─►\[\033[00m\]\$ \[\033[00m\]'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/home/rileyb/.ghcup/env" ] && source "/home/rileyb/.ghcup/env" # ghcup-env

# start shell with fastfetch
fastfetch
