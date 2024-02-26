function up
    if test -z $argv[1]
        set n 1
    else
        set n $argv[1]
    end

    for i in (seq $n)
        set change_path "$change_path../"
    end

    cd $change_path
end
