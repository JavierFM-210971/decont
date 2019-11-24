# This script should download the file specified in the first argument ($1), place it in the directory specified in the second argument, 
# and *optionally* uncompress the downloaded file with gunzip if the third argument contains the word "yes".

DIR=$2
URL=$1
myvar=$3

cd $DIR
wget $URL

if [ $myvar == "yes" ]; then
	wget -P $URL $DIR
	gunzip -k $DIR
else
	wget -P $URL $DIR
echo

