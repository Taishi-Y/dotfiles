export PLENV_ROOT=$HOME/.plenv
export PATH=$PLENV_ROOT/bin:$PATH
eval "$(plenv init -)"
source ~/.profile

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=$PATH:/Applications/MAMP/Library/bin
eval "$(rbenv init -)"
eval "$(rbenv init -)"

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export NVPACK_ROOT="/Users/yamasakitaishi/NVPACK"

export PATH=$PATH:"/Users/yamasakitaishi/NVPACK/android-sdk-macosx/tools"
export ANDROID_HOME="/Users/yamasakitaishi/NVPACK/android-sdk-macosx"

export PATH=$PATH:"/Users/yamasakitaishi/NVPACK/android-sdk-macosx/platform-tools"

export PATH=$PATH:"/Users/yamasakitaishi/NVPACK/android-sdk-macosx/build-tools"

export PATH=$PATH:"/Users/yamasakitaishi/NVPACK/android-sdk-macosx/extras/android/support"

export PATH=$PATH:"/Users/yamasakitaishi/NVPACK/android-ndk-r10e"

export NDK_ROOT="/Users/yamasakitaishi/NVPACK/android-ndk-r10e"
export NDKROOT="/Users/yamasakitaishi/NVPACK/android-ndk-r10e"
export NVPACK_NDK_VERSION="android-ndk-r10e"

export PATH=$PATH:"/Users/yamasakitaishi/NVPACK/apache-ant-1.8.2/bin"
export ANT_HOME="/Users/yamasakitaishi/NVPACK/apache-ant-1.8.2"

export PATH=$PATH:"/Users/yamasakitaishi/NVPACK/gradle-2.2.1/bin"
export GRADLE_HOME="/Users/yamasakitaishi/NVPACK/gradle-2.2.1"


JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home
export JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin

# nvm設定
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
nvm use default
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir

# 毎回実行しなくていいように設定を反映させるコマンドも書いておく
source ~/.nvm/nvm.sh
