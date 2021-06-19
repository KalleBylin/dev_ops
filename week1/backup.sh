#!/bin/bash

DIRNAME=$1
ALGORITHM=$2
OUTNAME=$3
LOGFILE="error.log"

function backup_and_encrypt {
	if [ "$ALGORITHM" == "gzip" ]; then
		tar -czvf $OUTNAME $DIRNAME
	elif [ "$ALGORTIHM" == "bzip" ]; then
		tar -cjvf $OUTNAME $DIRNAME
	else
		tar -cvf $OUTNAME $DIRNAME
	fi
	echo "Created backup"

	openssl enc -aes-256-cbc -in $OUTNAME -out $OUTNAME
	echo "Encrypted backup"
}

backup_and_encrypt 2>$LOGFILE

