#!/bin/sh

SKETCH_DIR="./"
HOOKDIR="./.git/hooks"
SCRIPT="./pre-commit"

cd `dirname $0`
cd $HOOKDIR

echo "#!/bin/sh" > $SCRIPT
echo "cd \`git rev-parse --show-toplevel\`" >> $SCRIPT
echo "cd $SKETCH_DIR" >> $SCRIPT
echo "sketchtool export artboards ./*.sketch --output=./artboards --scales 0.3" >> $SCRIPT
echo "cd -" >> $SCRIPT
echo "git add $SKETCH_DIR/artboards/*" >> $SCRIPT
chmod a+x $SCRIPT
git add $SCRIPT
