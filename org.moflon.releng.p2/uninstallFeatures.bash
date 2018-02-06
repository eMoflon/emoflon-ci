#!/bin/bash

#
# This script uninstalls all eMoflon-related features (also external dependencies).
# This ensures that the Eclipse installation is somewhat in a pristine state.
#
# Author: Roland Kluge
# Date: 2018-02-06
#

source common.inc.bash
[ "$?" == "0" ] || exit $?


echo "Collecting features to be uninstalled"
installedIUsTmpFile="installableUnitsList.tmp"
$ECLIPSE_HOME/eclipse -noSplash -application org.eclipse.equinox.p2.director -listInstalledRoots > $installedIUsTmpFile

listOfFeaturesToBeUninstalled=""
# Insert into the list all feature IDs as you find them in the feature.xml files
# All IDs:
# org.moflon.core.feature org.moflon.ide.feature org.moflon.tgg.mosl.feature org.moflon.ide.visualization.feature org.moflon.gt.mosl.pattern.language.feature org.moflon.gt.mosl.controlflow.language.feature
for installationUnit in \
org.moflon.core.feature \
org.moflon.ide.feature \
org.moflon.tgg.mosl.feature \
org.moflon.ide.visualization.feature \
org.moflon.gt.mosl.pattern.language.feature \
org.moflon.gt.mosl.controlflow.language.feature \
net.sourceforge.plantuml.feature \
net.sourceforge.plantuml.lib.feature \
net.sourceforge.plantuml.ecore.feature \
org.gervarro.eclipse.util.feature \
org.gervarro.democles.feature.specification \
org.gervarro.democles.feature.compiler\
;
do
  fullyQualifiedIUName="$installationUnit.feature.group"
  if [ "$(grep $fullyQualifiedIUName $installedIUsTmpFile)" != "" ];
  then
    if [ "$(echo $listOfFeaturesToBeUninstalled | wc -c)" != "1" ];
    then
      listOfFeaturesToBeUninstalled="$listOfFeaturesToBeUninstalled,"
    fi
    listOfFeaturesToBeUninstalled="$listOfFeaturesToBeUninstalled$fullyQualifiedIUName"
  else
    echo "Skipping $fullyQualifiedIUName because it is not installed."
  fi
done

rm $installedIUsTmpFile

if [ "$listOfFeaturesToBeUninstalled" != "" ];
then
  echo "Uninstalling '$listOfFeaturesToBeUninstalled'"
  $ECLIPSE_HOME/eclipse \
    -noSplash \
    -application org.eclipse.equinox.p2.director \
    -uninstallIU $listOfFeaturesToBeUninstalled
else
  echo "No features to uninstall."
fi

#echo "Gargbage collection..."
#$ECLIPSE_HOME/eclipse \
#  -noSplash \
#  -application org.eclipse.equinox.p2.garbagecollector.application

echo "Bye bye."
