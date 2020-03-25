#!/bin/bash
echo "the server will be accessible at https://<server>:1234"
cd /opt/app-root/src/node_modules/@tensorflow-models/posenet/demos
yarn
yarn watch --https


