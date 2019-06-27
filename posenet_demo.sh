#!/bin/bash

container=$(buildah from ubi7/nodejs-8)

buildah --user root run $container bash -c 'npm install yarn'

buildah --user root run $container bash -c 'npm install rollup'

buildah --user root run $container bash -c 'npm install @tensorflow/tfjs'

buildah --user root run $container bash -c 'npm install @tensorflow-models/posenet'

buildah copy $container '/home/tbrunell/posenet/files/' '/opt/app-root/src/node_modules/@tensorflow-models/posenet'

buildah --user root run $container bash -c 'chmod +x /opt/app-root/src/node_modules/@tensorflow-models/posenet/yarn.sh'

buildah --user root run $container bash -c '/opt/app-root/src/node_modules/@tensorflow-models/posenet/yarn.sh'
