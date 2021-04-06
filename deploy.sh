

ORIGINAL_WD=$(pwd)

# download and install doorstop

git clone https://github.com/douglase/doorstop

cd doorstop

python setup.py install

cd ${ORIGINAL_WD}

pwd 

 doorstop_sync.sh 
