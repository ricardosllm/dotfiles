alias ll='/bin/ls -lah'

# Editor
set -x EDITOR 'vim'
set -x VISUAL 'emacsclient -n'

# App alias
alias e='emacsclient -n'
alias et='emacsclient -nw'
alias subl='open -a "Sublime Text"'
alias webstorm='open -a "WebStorm"'
alias cursive='open -a "IntelliJ IDEA 15 CE"'
alias finder='open -a "Finder"'
alias java6='set -x JAVA_HOME /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home; echo "Changed JAVA_HOME to JDK 1.6"; java -version'

# Git
alias gitx='open -a "GitX"'
alias gitpp='git stash; git pull --rebase; git push; git stash pop'
alias gg='git grep'
alias gp='git pull --rebase'
alias gitc='git checkout'
alias gits='git status'
alias gitd='git diff'
alias gitp='git stash; git pull --rebase; git stash pop'

# Rails
alias rw='set RAILS_ENV test; bundle exec rake xv_workers:work'
alias rc='docker-compose exec rails rails c'
alias ru='docker-compose up -d'
alias railss='set RAILS_ENV development; bundle exec rails s'
function rs
  set paths (string split '/spec' $argv)
  eval "bin/docker-exec rspec spec$paths[2]"
end

# Code
alias gini='cd ~/g/gini-app'

# Todo.txt
alias t='/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -d ~/.todo.cfg'

# Homebrew
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Locale
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LANG en_US.UTF-8

# Docker
alias docker-up='bash --login "/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh"'

# Golang
set -x GOPATH ~/Go/

# Python
## Get python2 executable in latest MacOS: brew install python2
set PATH "/usr/local/opt/python@2/bin" $PATH

# Google repo
set PATH "~/bin" $PATH
function repo
    ~/bin/repo
end

# Android build tools
set PATH $PATH "~/Library/Android/sdk/build-tools/28.0.2"
set PATH $PATH "/usr/local/opt/texinfo/bin"
alias aapt="~/Library/Android/sdk/build-tools/28.0.2/aapt"

# Keybinding
function fish_user_key_bindings
  bind \cj history-search-forward
  bind \ck history-search-backward
  bind \ch backward-char
  bind \cl forward-char
end

# UI
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)
set red (set_color -o red)
set white (set_color -o white)

function fish_prompt
	# set_color white
	# # printf '[%s] ' (date "+%j %H:%M:%S")
	# printf '%s ' (date "+%D %H:%M:%S")
  # set_color normal

	set_color red
	printf '%s' (whoami)
	set_color normal
	printf ' '

	set_color yellow
	printf '%s' (hostname|cut -d . -f 1)
	set_color normal
	printf ' in '

	set_color $fish_color_cwd
	printf '%s' (prompt_pwd)
	set_color normal

	set_color normal
	printf '%s ' (__fish_git_prompt)
	set_color normal

	# Line 2
	# echo
	printf "$red➤ "
	set_color normal
end

