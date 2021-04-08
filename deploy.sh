

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
