alias ll='ls -lah'

# Editor
set -x EDITOR 'emacsclient -n'
set -x VISUAL 'emacsclient -n'

# App alias
alias e='emacsclient -n'
alias subl='open -a "Sublime Text"'
alias webstorm='open -a "WebStorm"'
alias cursive='open -a "IntelliJ IDEA 15 CE"'
alias finder='open -a "Finder"'
alias java6='set -x JAVA_HOME /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home; echo "Changed JAVA_HOME to JDK 1.6"; java -version'

# Git
alias gitx='open -a "GitX"'
alias sppp='git stash; git pull --rebase; git push; git stash pop'
alias gg='git grep'
alias gc='git checkout'
alias gs='git status'
alias gitp='git stash; git pull --rebase; git stash pop'

# Rails
alias rs='set -x RAILS_ENV test; bundle exec rspec'
alias rw='set -x RAILS_ENV test; bundle exec rake xv_workers:work'
alias rc='set -x RAILS_ENV development; bundle exec rails c'

# Fish config for rbenv https://jeremywsherman.com/blog/2015/07/28/using-rbenv-with-fish/
set PATH "$HOME/.rbenv/shims" $PATH
rbenv rehash ^/dev/null
function rbenv
    set -l command $argv[1]
    if test (count $argv) -gt 1
        set argv $argv[2..-1]
    end

    switch "$command"
        case rehash shell
            eval (rbenv "sh-$command" $argv)
        case '*'
            command rbenv "$command" $argv
    end
end

# Docker
alias docker-up='bash --login "/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh"'

# Golang
set -x GOPATH ~/Go/
#set -x GOROOT /usr/local/opt/go/libexec

# set PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH

# set -x NODE_PATH /usr/local/lib/node_modules

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
	if test $VIRTUAL_ENV
	  printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
	end
	printf "$red➤ "
	set_color normal
end
