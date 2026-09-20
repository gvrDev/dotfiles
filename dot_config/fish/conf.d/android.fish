if test (uname -s) = 'Darwin'
    set -x JAVA_HOME (/usr/libexec/java_home -v 17)
    set -x ANDROID_HOME $HOME/Library/Android/sdk

    fish_add_path -g /opt/homebrew/bin /opt/homebrew/opt/ruby@3.3/bin /opt/homebrew/lib/ruby/gems/3.3.0/bin $ANDROID_HOME/platform-tools
else
    set -gx ANDROID_SDK_HOME $HOME
end
