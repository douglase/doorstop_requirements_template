

ORIGINAL_WD=$(pwd)

# download and install doorstop

git clone  --branch develop https://github.com/douglase/doorstop doorstop_lib

cd doorstop_lib

python setup.py install

cd ${ORIGINAL_WD}

#cleanup, otherwise breaks with multiple 
rm -rf doorstop_lib

#copy the gitinfo2 web-hook 
cp  guides/example_hook.txt ./git/post-commit
#make executable
chmod g+x p./git/post-commit

pwd 

./doorstop_sync.sh 
