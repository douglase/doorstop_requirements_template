

ORIGINAL_WD=$(pwd)

# download and install doorstop

git clone  --branch develop https://github.com/douglase/doorstop doorstop_lib

cd doorstop_lib

python setup.py install

cd ${ORIGINAL_WD}

pwd 

./doorstop_sync.sh 
