################
### 環境変数 ###
################
export LANG=ja_JP.UTF-8
 
# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
 
# 色を使用出来るようにする
autoload -Uz colors
colors
 
# ヒストリの設定 
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
 
 
##################
### プロンプト ###
##################
local p_cdir="%B%F{yellow}[%~]%f%b"
DEFAULT=$'\U1F603 '
ERROR=$'\U1F47F '
local p_emoji="%(?,${DEFAULT},${ERROR})"
local p_mark="%B%(?,%F{green}▶,%F{red}▶)%f%b"
 
PROMPT="
$p_emoji $p_cdir
$p_mark "
 
 
################
### 補完機能 ###
################
#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
# 補完機能を有効にする
autoload -Uz compinit
compinit -u
 
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
 
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
 
 
################
### vcs_info ###
################
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
 
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
 
function _update_vcs_info_msg() {
  STY= LANG=en_US.UTF-8 vcs_info
	local prefix branchname suffix
  # .gitの中だから除外
  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    RPROMPT=""
		return
  fi
  branchname=`get-branch-name`
  # ブランチ名が無いので除外
	if [[ -z $branchname ]]; then
		RPROMPT=""
		return
  fi
  prefix=`get-branch-status` #色だけ返ってくる
  suffix='%{'${reset_color}'%}'
  RPROMPT="${prefix}%B${branchname}%b${suffix}"
}
function get-branch-name {
  # gitディレクトリじゃない場合のエラーは捨てます
  echo "$vcs_info_msg_0_"
	#echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}
 
function get-branch-status {
	local res color
	output=`git status --short 2> /dev/null`
	if [ -z "$output" ]; then
		res=':' # status Clean
		color='%{'${fg[green]}'%}'
	elif [[ $output =~ "[\n]?\?\? " ]]; then
		res='?:' # Untracked
		color='%{'${fg[yellow]}'%}'
	elif [[ $output =~ "[\n]? M " ]]; then
		res='M:' # Modified
		color='%{'${fg[red]}'%}'
	else
		res='A:' # Added to commit
		color='%{'${fg[cyan]}'%}'
	fi
	# echo ${color}${res}'%{'${reset_color}'%}'
	echo ${color} # 色だけ返す
}
add-zsh-hook precmd _update_vcs_info_msg
 
 
##################
### オプション ###
##################
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
 
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35'
zstyle ':completion:*' list-colors 'di=36' 'ln=35'

# cdしたあとで、自動的に ls する
function chpwd() { ls -1 }
 
##################
### エイリアス ###
##################
alias la='ls -a'
alias l='ls -l'
alias p='cd `find ~/Develop/ | peco`'
alias vi='vim'


export PATH=$PATH:/Applications/MAMP/Library/bin
export NVM_DIR="/Users/yamasakitaishi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc
