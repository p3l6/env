function fish_prompt
    set -l last_status $status

    if test "$TERM_PROGRAM" = "WarpTerminal"
        echo '> '
        return
    end

    set -g __fish_git_prompt_show_informative_status yes
    set -g __fish_git_prompt_showdirtystate yes
    set -g __fish_git_prompt_showuntrackedfiles yes
    set -g __fish_git_prompt_showcolorhints yes
    set -g __fish_git_prompt_char_dirtystate '!'
    set -g __fish_git_prompt_char_untrackedfiles '?'
    set -g __fish_git_prompt_char_upstream_behind '↓'
    set -g __fish_git_prompt_char_upstream_ahead '↑'
    set -g __fish_git_prompt_char_stateseparator ' '
    set -g __fish_git_prompt_color_flags blue

    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status] "(set_color normal)
    end

    if test "$TRANSIENT" = "1"
        printf \e\[0J # https://github.com/fish-shell/fish-shell/issues/8418
        string join '' -- (set_color cyan) (basename $PWD) ' ' (set_color yellow) (date "+%-l:%M%p") (set_color magenta) ' > ' (set_color normal)
    else
        echo
        string join '' -- (set_color cyan) (basename $PWD) (set_color normal) (fish_git_prompt) ' ' (set_color cyan) (prompt_pwd -D 4) (set_color normal)
        string join '' -- $stat (set_color magenta) '> ' (set_color normal)
    end
end


function reset-transient --on-event fish_postexec
    set -g TRANSIENT 0
end

function maybe_execute
    if commandline --is-valid
        set -g TRANSIENT 1
        commandline -f repaint
    else
        set -g TRANSIENT 0
    end
    commandline -f execute
end

bind \r maybe_execute
