# P2-related resources for building/testing eMoflon releases
This project contains utilities related to the P2 Director of Eclipse
See the following URL for more information:
https://help.eclipse.org/oxygen/index.jsp?topic=%2Forg.eclipse.platform.doc.isv%2Fguide%2Fp2_director.html

## Preparation
* Open a new (Bash) shell
* Create a copy of *setEnvVars.inc.bash.sample* to *setEnvVars.inc.bash* and follow the instructions therein.
* Invoke ```source setEnvVars.inc.bash```
* Invoke the desird task-specific scripts

## Task-specific scripts
* For installing one or more features, use the script *installFeatures.bash*.
   * You may specify which features to install inside the script.
* For uninstalling one or more features, use the script *uninstallFeatures.bash*.
   * You may specify which features to uninstall inside the script.

