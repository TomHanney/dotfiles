## Might be better to make a script to do this one day...esp if we need to 
## mkdir /mnt/gracie/...
## Remember to install cifs-utils to fix errors like:
## mount: wrong fs type, bad option, bad superblock on //192.168.1.69/Data
## [http://stackoverflow.com/questions/6734400/what-does-cifs-mount-failed-w-return-code-22-indicate]
alias mount-gracie='sudo mount -t cifs -o user=tom,sec=ntlm //192.168.1.68/Data /home/share/gracie'
## Use ip to instead of stimpy in the mount command now, but the mechanic is still 
## to connect via the pi (stimpy) samba service
alias mount-lacie='sudo mount -t cifs -o user=tom,uid=tom,gid=tom //192.168.1.69/lacie/tom /home/share/lacie'

## Not sure about the persistence of the history file
## Might need to run this every time on shutdown and pipe output to file
## The for loop is to capture cases where multiple packages are installed in a single 
## command line call
## TODO: account for packages uninstalled using apt-get remove...
## REMOVED: the grep command is now used in the apt-packages script. 
## Here we just run the script and pipe the output (the updated file) to cat
#alias apt-installed='grep "apt-get install" </var/log/apt/history.log | awk "{for(i=4; i<=NF; i++) print \$i;}"'
alias apt-installed='/home/tom/scripts/apt-packages | xargs -I % cat %'
alias apt-install='sudo apt-get install'
alias apt-search='apt-cache search'

## shortcut searches in the cl history
alias ch='history | grep'

alias todo='/media/tom/hd/dotfiles/script/todo.txt_cli-2.9/todo.sh'
alias sublime='/home/tom/software/sublime_text_3/sublime_text'
alias pycharm='/home/tom/software/pycharm-community-3.1.1/bin/pycharm.sh'
