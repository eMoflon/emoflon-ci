if [ ! -f $ECLIPSE_HOME/eclipse ];
then
  echo "Make sure that \$ECLIPSE_HOME points to an Eclipse directory"
  exit -1
fi

if [ "$LOCAL_UPDATE_SITES" == "" ];
then
  echo "You need to provide the \$LOCAL_UPDATE_SITES environment variable."
  exit -2
fi