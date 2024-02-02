function finder
    set target (osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')

    if string length -q $target
        cd $target
        pwd
    else
        echo 'No Finder window found' >&2
        return 1
    end
end
