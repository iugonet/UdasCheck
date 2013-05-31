#!/bin/bash

QALIST=QAscript.list
RESFILE=Result_QA.txt

## Restore Directory
if [ -e $RESFILE ]; then
#  echo $RESFILE
  rm -f $RESFILE
fi
echo 'Result from QA scripts' > $RESFILE
echo '' >> $RESFILE

## Read QA script list and Exec IDL
while read QA_SCRIPT
do
  if [ -n $QA_SCRIPT ]; then
    if [[ ! $QA_SCRIPT =~ ^# ]]; then
      echo 'MESSAGE> QA script = ['$QA_SCRIPT']'
      sleep 5
      echo $QA_SCRIPT >> $RESFILE
      idl << _EOF_
       .run $QA_SCRIPT
_EOF_
    fi
  fi
done < $QALIST

# END
