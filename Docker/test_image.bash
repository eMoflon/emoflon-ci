#!/bin/bash

docker run -i -t emoflon/emoflon-ci /bin/bash
echo "Test procedure:
git clone https://github.com/eMoflon/emoflon-core.git && cd emoflon-core && mvn clean install
"
