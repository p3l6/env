function readme
    set -l readme_file (path filter ./README* ./readme* ./Readme*)[1]
    and less $readme_file
    or echo "Error: No reamde file found"
end
