#!/bin/bash

source common.inc.bash
[ "$?" == "0" ] || exit $?

allRepositories="$LOCAL_UPDATE_SITES,http://files.idi.ntnu.no/publish/plantuml/repository/,http://download.eclipse.org/releases/oxygen/"

installableUnits=""
# All IDs:
# org.moflon.core.feature org.moflon.ide.feature org.moflon.tgg.mosl.feature org.moflon.ide.visualization.feature org.moflon.gt.mosl.pattern.language.feature org.moflon.gt.mosl.controlflow.language.feature
for installableUnit in \
org.moflon.core.feature \
org.moflon.ide.feature \
org.moflon.tgg.mosl.feature \
#org.moflon.ide.visualization.feature \
# org.moflon.gt.mosl.pattern.language.feature \
# org.moflon.gt.mosl.controlflow.language.feature
do
  if [ "$(echo $installableUnits | wc -c)" != "1" ];
  then
    installableUnits="$installableUnits,"
  fi
  installableUnits="$installableUnits$installableUnit.feature.group"
done

echo "Installing '$installableUnits'"
$ECLIPSE_HOME/eclipse \
  -noSplash \
  -repository $allRepositories \
  -application org.eclipse.equinox.p2.director \
  -installIU $installableUnits

defaultAnswer="Y"
read -p "Open Eclipse now? [$defaultAnswer/n] " -i "$defaultAnswer" -e shallOpenEclipse

if [ "$shallOpenEclipse" == "$defaultAnswer" ];
then
    $ECLIPSE_HOME/eclipse &
fi

echo "Bye bye."