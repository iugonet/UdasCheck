#!/bin/bash
# ---------------------------------------------------------------------------- #
# udas-checker.sh for IUGONET, ver.1.00
# Released on 2012.07.03, by STEL, N.UMEMURA
# ---------------------------------------------------------------------------- #
#
#  -- INTRODUCTION --
#  This script run IDL and JAVA Programs automatically.
#  First, Run IDL and output plot image(s). Next, call JAVA programs which
#  compare the image(s) saved beforehand and the image(s) created newly.
#  Finally, output the result about whether two images are in agreement.
#
#  -- HOW TO RUN --
#  Run this command.
#  $ ./udas-checker.sh -m [EXEC_MODE(CUI or GUI)]
#  OPTIONS:
#   -m [EXEC_MODE]: Choose CUI or GUI.
#
#  -- CONTACT --
#  STEL, N.UMEMURA <umemura@stelab.nagoya-u.ac.jp>
#
# ---------------------------------------------------------------------------- #
#

#### [START] Define ############################################################

#### Variable Parameters ####


#### Invariable Parameters ####

## Env
DIR=$(cd $(dirname $0);pwd)
DIR_IMG_BASE=images/base
DIR_IMG_NEW=images/new
DIR_IMG_OLD=images/old
DIR_SRC=src
JUNITJAR=${DIR_SRC}/lib/junit-4.9b4.jar
CRIBLIST=conf/crib_sheet_list.conf

## Exec Mode
UDASMODE=NONE
PASSUDAS=0      # 0: EXEC, 1:PASS
PASSCOMP=0      # 0: EXEC, 1:PASS

## Date
DATE1=`date '+%Y%m%d%H%M%S'`

## Char
VERSION='1.00'
RELEASED='2012.07.03'
CONTACT='STEL, N.UMEMURA. umemura@stelab.nagoya-u.ac.jp'
USAGE='./udas-checker.sh -m [EXEC_MODE(CUI or GUI)]'
#USAGE='./udas-checker.sh -m [EXEC_MODE(CUI or GUI)] (-u -c)'
ERRORFINISH='Program FINISHED: Nothing Done.'

#### [END] Define ##############################################################


#### [START] Initialize ########################################################

#### Message Out ####
echo '>>> ------------------------------------------------------------------'
echo '>>>  [UDAS Checker] for IUGONET.'
echo '>>>  Exec UDAS and Compare Images.'
echo '>>>  Version: '${VERSION}', Released: '${RELEASED}
#echo '>>>  Contact: '${CONTACT}
echo '>>> ------------------------------------------------------------------'
echo 'MESSAGE> Program START.' 

#### Get Args ####
while getopts m:uc OPT
do
  case $OPT in
  ## Exec Mode
  m)
    UDASMODE=$OPTARG;;
  ## Skip UDAS
  u)
    PASSUDAS=1;;
  ## Skip Compare
  c)
    PASSCOMP=1;;
  ## Command Error
  *)
    echo '##ERROR> Invalid Command.';
    echo 'MESSAGE> '$USAGE;
    echo 'MESSAGE> '$ERRORFINISH;
    exit 0;;
  esac
done

#### Check Args ####
if [ $PASSUDAS = 0 ]; then
  if [ $UDASMODE != "GUI" -a $UDASMODE != "CUI" ]; then
    echo '##ERROR> Invalid Command.'
    echo 'MESSAGE> '$USAGE
    echo 'MESSAGE> '$ERRORFINISH
    exit 0;
  fi
fi

## Debug
#echo 'EXECMODE=['$EXECMODE']'
#echo 'PASSUDAS=['$PASSUDAS']'
#echo 'PASSCOMP=['$PASSCOMP']'

#### [END] Initialize ##########################################################


#### [START] Exec crib_sheet ###################################################

#### Message Out ####
echo 'MESSAGE> [Step.1] Exec UDAS...'

#### Exec ####
if [ $PASSUDAS = 0 ]; then

  #### CUI ####
  if [ $UDASMODE = "CUI" ]; then

    ## Change Directory
    cd $DIR

    ## Restore Directory
    if [ -d ${DIR_IMG_NEW} ]; then
      rm -rf ${DIR_IMG_NEW}
    fi
    mkdir ${DIR_IMG_NEW}

    ## Change Directory
    cd ${DIR_IMG_NEW}

    ## Read crib_sheet and Exec IDL
    while read CRIB_SHEET
    do
      if [ -n $CRIB_SHEET ]; then
        if [[ ! $CRIB_SHEET =~ ^# ]]; then
          echo 'MESSAGE> crib_sheet = ['$CRIB_SHEET']'
          sleep 5
          idl << _EOF_
           .run $CRIB_SHEET
_EOF_
        fi
      fi
    done < $DIR/$CRIBLIST

    ## Change Directory
    cd $DIR

    ## Message Out
    echo 'MESSAGE> [Step.1] Exec UDAS... [Done]  Please wait a few seconds.'

  #### GUI ####
  elif [ $UDASMODE = "GUI" ]; then
    echo 'MESSAGE> GUI Mode Not Yet.'
    echo 'MESSAGE> [Step.1] Exec UDAS... [Skipped]  Please wait a few seconds.'
  fi

  #### Backup Files ####
  if [ -d ${DIR_IMG_NEW} ]; then
    cp -pr ${DIR_IMG_NEW} ${DIR_IMG_OLD}/${DATE1}
  fi

#### Exec (Skip UDAS) ####
else
  ## Message Out
  echo 'MESSAGE> [Step.1] Exec UDAS... [Skipped]  Please wait a few seconds.'
fi

#### Finalize ####
sleep 5


#### [END] Exec crib_sheet #####################################################


#### [START] Compare Images ####################################################

#### Message Out ####
echo 'MESSAGE> [Step.2] Compare Images...'

#### Check and Set Env ####
RESULTNUM=`env | grep CLASSPATH | grep junit | wc -l`
if [ $RESULTNUM = 0 ]; then
  RESULTNUM=`env | grep CLASSPATH | wc -l`
  if [ $RESULTNUM = 0 ]; then
    CLASSPATH=".:${DIR}/${JUNITJAR}"
  else
    CLASSPATH="$CLASSPATH:.:${DIR}/${JUNITJAR}"
  fi
  export CLASSPATH
fi

#### Exec ####
if [ $PASSCOMP = 0 ]; then

  ## Change Directory
  cd $DIR/$DIR_SRC

  ## Compare
  java org/iugonet/main/CompImgUDAS

  ## Change Directory
  cd $DIR

  ## Message Out
  echo 'MESSAGE> [Step.2] Compare Images... [Done]'

#### Exec (SKip) ####
else
  ## Message Out
  echo 'MESSAGE> [Step.2] Compare Images... [Skipped]'
fi

#### [END] Compare Images ######################################################


#### [START] Finalize ##########################################################

#### Message Out ####
echo 'MESSAGE> Program Finished.'

#### [END] Finalize ############################################################