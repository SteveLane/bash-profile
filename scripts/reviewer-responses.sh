#!/usr/bin/env bash
# Time-stamp: <2018-03-23 14:24:23 (slane)>
# Script to retrieve responses to reviewers from git commits.
# Must be run in a git repository (should check...)

# Exit if no arguments were provided.
[ $# -eq 0 ] && { echo "Usage: $0 [number of reviewers] [output name]"; exit 1; }

# Arguments are: number of reviewers, name of output file

echo "# Responses to Reviewers Comments
" > $2.md

for (( n=1; n<=$1; n++ ))
do
    # First, extract the comments.
    echo "Extracting responses to Reviewer $n"
    echo "
## Reviewer $n
" >> $2.md
    git log --reverse --grep="Reviewer $n" --pretty=format:"%s%n%n%b" >> $2.md

    # Now, note that reviewer comments start with 'Reviewer X', so delete those
    sed -i.bak '/^Reviewer/ d' $2.md

    # Now, the way I structure the git comments is to have * in place of #
    # This is because # in git commit messages gets ignored.
    # Replace * with # (doing the hard way in case there's extra of these characters floating around)
    sed -i.bak 's/^\*\*\* /\#\#\# /g' $2.md
    sed -i.bak 's/^\*\*\*\* //g' $2.md

    # Finally, convert the markdown to docx
    pandoc -o $2.docx $2.md
done

# Remove backup
rm $2.md.bak
