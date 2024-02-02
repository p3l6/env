function fish_right_prompt
    if test "$TERM_PROGRAM" = "WarpTerminal"
        echo '> '
        return
    end

    if test "$TRANSIENT" = "0"
        set -l duration
        if test $CMD_DURATION
            set duration "took $(math -s 2 $CMD_DURATION / 1000) sec "
        end

        string join '' -- $duration (set_color yellow) (date "+%-l:%M%p") (set_color normal)
    end
end
