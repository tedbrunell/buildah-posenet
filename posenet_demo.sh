#!/bin/bash

container=$(buildah from ubi7/nodejs-8)

buildah run $container bash -c 'npm install yarn'

buildah run $container bash -c 'npm install rollup'

buildah run $container bash -c 'npm install @tensorflow/tfjs'

buildah run $container bash -c 'npm install @tensorflow-models/posenet'

<<<<<<< HEAD
buildah copy $container '/home/tbrunell/git/buildah-posenet/files/' '/opt/app-root/src/node_modules/@tensorflow-models/posenet'
=======
buildah copy $container '/PATH_TO_POSENET/files/' '/opt/app-root/src/node_modules/@tensorflow-models/posenet'
>>>>>>> ceda559a5eef58e7560e800d2640e538338092b9

buildah run $container bash -c 'chmod +x /opt/app-root/src/node_modules/@tensorflow-models/posenet/yarn.sh'

buildah config --entrypoint '/opt/app-root/src/node_modules/@tensorflow-models/posenet/yarn.sh' $container

buildah commit $container posenet_demo

echo "If all went well you should be able to run"
echo "the posenet container."
echo "podman run --name posenet_demo -it -p 1234:1234 posenet_demo"

