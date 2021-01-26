#! /bin/bash

if [ $# -ne 1 ] || [ ! -f $1 ]; then
  echo "Bad argument: need exported opml file"
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

inputFile=$(pwd)/$1
outputFile="$DIR/Unified.opml"
cd $DIR

# create files
cat $inputFile > $outputFile
cat > header.bak <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<opml version="2.0"><head><title>RSS</title></head><body>

EOF
cat > footer.bak <<EOF

</body></opml>
EOF

# strip extra fields
sed -E -i.bak 's/ ?title="[^"]*"//g' $outputFile
sed -E -i.bak 's/ ?description="[^"]*"//g' $outputFile
sed -E -i.bak 's/ ?version="[^"]*"//g' $outputFile

# sort remianing fields: type text xml html
sed -E -i.bak 's/(text="[^"]*") (type="[^"]*") (htmlUrl="[^"]*") (xmlUrl="[^"]*")/\2 \1 \4 \3 /' $outputFile

# fix indentation
sed -E -i.bak 's/\t/  /g' $outputFile
sed -E -i.bak 's/  </</' $outputFile

# remove items not in any folder
sed -E -i.bak '/^<outline type="rss"/d' $outputFile

# replace header and footer
sed -E -i.bak -n 's/outline/outline/p' $outputFile
sed -E -i.bak 's|^<outline text|\n<outline text|' $outputFile
sed -E -i.bak 's|^</outline>|</outline>\n|' $outputFile
cat header.bak $outputFile footer.bak > tempFile
mv tempFile $outputFile

# break long lines (sed conditions)
sed -E -i.bak '/.{175}/ s/ (text="[^"]*") (xmlUrl="[^"]*") (htmlUrl="[^"]*")/\n    \1\n    \2\n    \3\n /' $outputFile

# split folders into separate files
split -p "^<outline text" $outputFile parts_
for partFile in parts_*; do
  name=$(sed -E -n 's/<outline text="([^"].*)">/\1/p' $partFile)
  if [ ! -z $name ]; then
    # only keep folder contents
    sed -E -i.bak -n 's/^  //p' $partFile
    cat header.bak $partFile footer.bak > $name.opml
  fi
done

# clean up
rm -f *.bak
rm -f parts_*
