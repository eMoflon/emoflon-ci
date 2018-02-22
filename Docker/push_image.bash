#!/bin/bash

# Deploy me with
docker tag emoflon-ci emoflon/emoflon-ci
docker login
docker push emoflon/emoflon-ci

