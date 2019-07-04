#!/bin/bash

container=$(buildah from ubi7/nodejs-8)

buildah run $container bash -c 'npm install yarn'

buildah run $container bash -c 'npm install rollup'

buildah run $container bash -c 'npm install @tensorflow/tfjs'

buildah run $container bash -c 'npm install @tensorflow-models/posenet'

buildah copy $container '/PATH_TO/posenet/files/' '/opt/app-root/src/node_modules/@tensorflow-models/posenet'

buildah run $container bash -c 'chmod +x /opt/app-root/src/node_modules/@tensorflow-models/posenet/yarn.sh'

buildah config --entrypoint '/opt/app-root/src/node_modules/@tensorflow-models/posenet/yarn.sh' $container

buildah commit $container posenet_demo

echo "If all went well you should be able to run"
echo "the posenet container."
echo "sudo podman run -name posenet_demo -it -p 1234:1234 posenet_demo"

