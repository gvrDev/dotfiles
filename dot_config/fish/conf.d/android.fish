set -x ANDROID_SDK_HOME ~/.android
if test (uname -s) = 'Darwin'
    set -x JAVA_HOME (/usr/libexec/java_home -v 17)
    set -x ANDROID_HOME $HOME/Library/Android/sdk

    fish_add_path -g /opt/homebrew/bin /opt/homebrew/opt/ruby@3.3/bin /opt/homebrew/lib/ruby/gems/3.3.0/bin $ANDROID_HOME/platform-tools
else
    fish_add_path ~/Android/Sdk/platform-tools ~/Android/Sdk/emulator
    set -x ANDROID_HOME $HOME/Android/Sdk
end
