#!/bin/bash

#
# This script prints out the list of installed features of the configured Eclipse installation
#
# Author: Roland Kluge
# Date: 2018-02-08
#

source common.inc.bash
[ "$?" == "0" ] || exit $?

tmpFile=$(mktemp)
$ECLIPSE_HOME/eclipse -noSplash -application org.eclipse.equinox.p2.director -listInstalledRoots > $tmpFile
cat $tmpFile
rm $tmpFile
