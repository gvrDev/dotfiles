if test (uname -s) = 'Darwin'
    set -x JAVA_HOME (/usr/libexec/java_home -v 17)
    set -x ANDROID_HOME $HOME/Library/Android/sdk

    fish_add_path -g /opt/homebrew/bin /opt/homebrew/opt/ruby@3.3/bin /opt/homebrew/lib/ruby/gems/3.3.0/bin $ANDROID_HOME/platform-tools
else
    set -gx ANDROID_HOME /opt/android-sdk
    set -gx ANDROID_SDK_ROOT /opt/android-sdk
    set -gx ANDROID_SDK_HOME $HOME

    fish_add_path -g /opt/android-sdk/emulator /opt/android-sdk/platform-tools /opt/android-sdk/cmdline-tools/latest/bin
end
