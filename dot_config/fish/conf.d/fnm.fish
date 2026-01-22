set FNM_PATH "/home/gui/.local/share/fnm"

if test -d "$FNM_PATH"
    set -gx PATH "$FNM_PATH" $PATH
    fnm env --shell fish | source
end
fnm env --use-on-cd --shell fish | source
