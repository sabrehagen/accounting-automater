#!/bin/bash

sleep 3

CURMTH=$1
CURYR=$2
ACCT_NUM=$3

if [ $ACCT_NUM -eq "1" ]
then ACCT="02120"
fi
if [ $ACCT_NUM -eq "2" ]
then ACCT="02175"
fi
if [ $ACCT_NUM -eq "3" ]
then ACCT="02265"
fi

for i in {1..12}
do

    if [ $CURMTH -eq 1 ]
    then PRVMTH=12
         PRVYR=`expr $CURYR - 1`
    else PRVMTH=`expr $CURMTH - 1`
         PRVYR=$CURYR
    fi

    if [ $PRVMTH -lt 10 ]
    then PRVMTH="0"$PRVMTH
    fi

    LASTDY=`cal $PRVMTH $PRVYR | egrep "28|29|30|31" |tail -1 |awk '{print $NF}'`

    . ./xdoscript.sh 01/$PRVMTH/20$PRVYR $LASTDY/$PRVMTH/20$PRVYR $ACCT $ACCT_NUM $PRVYR-$PRVMTH-01

    CURMTH=`expr $CURMTH + 1`
    if [ $CURMTH -gt 12 ]
    then
        CURMTH=1
        CURYR=`expr $CURYR + 1`
    fi

done
