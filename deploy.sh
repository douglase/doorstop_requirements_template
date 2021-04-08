

ORIGINAL_WD=$(pwd)

# download and install doorstop

git clone  --branch develop https://github.com/douglase/doorstop doorstop_lib

cd doorstop_lib

python setup.py install

cd ${ORIGINAL_WD}

#cleanup, otherwise breaks with multiple 
rm -rf doorstop_lib

#copy the gitinfo2 web-hook 
#make executable
chmod g+x ./example_hook.sh
./example_hook.sh

pwd 

./doorstop_sync.sh 


mkdir .git
# get git parameters:

# Copyright 2015 Brent Longborough
# Part of gitinfo2 package Version 2
# Release 2.0.7 2015-11-22
# Please read gitinfo2.pdf for licencing and other details
# this work —gitinfo2— may be distributed and/or modified under theconditions of the LaTeX Project Public License:
# (http://ctan.math.utah.edu/ctan/tex-archive/macros/latex/contrib/gitinfo2/gitinfo2.pdf)
# -----------------------------------------------------
# Post-{commit,checkout,merge} hook for the gitinfo2 package
#
# Get the first tag found in the history from the current HEAD
FIRSTTAG=$(git describe --tags --always --dirty='-*' 2>/dev/null)
# Get the first tag in history that looks like a Release
RELTAG=$(git describe --tags --long --always --dirty='-*' --match '[0-9]*.*' 2>/dev/null)
# Hoover up the metadata
git --no-pager log -1 --date=short --decorate=short \
    --pretty=format:"\usepackage[%
        shash={%h},
        lhash={%H},
        authname={%an},
        authemail={%ae},
        authsdate={%ad},
        authidate={%ai},
        authudate={%at},
        commname={%cn},
        commemail={%ce},
        commsdate={%cd},
        commidate={%ci},
        commudate={%ct},
        refnames={%d},
        firsttagdescribe={$FIRSTTAG},
        reltag={$RELTAG}
    ]{gitexinfo}" HEAD > .git/gitHeadInfo.gin
