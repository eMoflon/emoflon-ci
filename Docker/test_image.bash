#!/bin/bash

echo "
#Run the CI workflow inside the Docker container as follows:
cd emoflon-core
bash ./shippable.bash
"
docker run -i -t emoflon/emoflon-ci /bin/bash

