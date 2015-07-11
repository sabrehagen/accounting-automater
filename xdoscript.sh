#!/bin/bash

DATE1=$1
DATE2=$2
ACCT=$3
ACCT_NUM=$4
FILENAME_DATE=$5

#WID=`xdotool search --name "Web Page Name" | head -1`
#xdotool windowfocus $WID

# script must be started on download page, ready to be history-1'd

xdotool key BackSpace # => return to transaction history page

sleep 3

xdotool key Tab       # => for account
xdotool type $ACCT    # => select account
xdotool key Tab       # => transaction type
xdotool key Tab       # => in date format
xdotool key Tab       # => transaction order
xdotool key Tab       # => description search
xdotool key Tab       # => cheque number
xdotool key Tab       # => account min
xdotool key Tab       # => account max
xdotool key Tab       # => transactions for
xdotool key s         # => selected date range
xdotool key Tab       # => from
xdotool type $DATE1   # => type from date
xdotool key Tab       # => to
xdotool type $DATE2   # => type to date
xdotool key Tab       # => radio buttons
xdotool key Down      # => select download in csv
xdotool key Tab       # => get transactions
xdotool key Return    # => submit get transactions button

sleep 2

# type filename
xdotool type $FILENAME_DATE
xdotool type " "
xdotool type $ACCT_NUM

sleep 1

xdotool key Return # => save download

sleep 1

xdotool key Escape # => clear selection