alias ll='ls -lah'
alias gg='git grep'
alias gitp='git stash; git pull --rebase; git stash pop'
alias subl='open -a "Sublime Text"'
alias gitx='open -a "GitX"'
alias webstorm='open -a "WebStorm"'
alias cursive='open -a "IntelliJ IDEA 15 CE"'
alias finder='open -a "Finder"'
alias e='emacsclient -n'
alias java6='set -x JAVA_HOME /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home; echo "Changed JAVA_HOME to JDK 1.6"; java -version'

set -x ANDROID_HOME ~/Developer/android/adt-bundle/sdk

# Golang
set -x GOPATH ~/Go/
#set -x GOROOT /usr/local/opt/go/libexec

set PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH

set -x NODE_PATH /usr/local/lib/node_modules

# DOCKER
set -x DOCKER_HOST tcp://192.168.59.103:2376
set -x DOCKER_CERT_PATH /Users/ricardo/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1

# Keybinding
function fish_user_key_bindings
  bind \cj down-or-search
  bind \ck up-or-search
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
