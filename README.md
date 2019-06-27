# buildah-posenet

Buildah Posenet is a script to create a container for the posenet demos that are found at:
https://github.com/tensorflow/tfjs-models/tree/master/posenet

This script uses the Red Hat Univeral Base Image v7 (ubi7) NodeJS-8 image as the base container image.  You will need to make sure that you have access to the Red Hat container registry (https://registry.access.redhat.com). 

To create the container, edit the posenet_demo.sh file and change PATH_TO to your path.
```
buildah copy $container '/PATH_TO/posenet/files/' '/opt/app-root/src/node_modules/@tensorflow-models/posenet'
```
would become 
```
buildah copy $container '/home/ted/posenet/files/' '/opt/app-root/src/node_modules/@tensorflow-models/posenet'
```
Once the edit is made, make the script execultable and run it.
```
cd /home/ted/posenet
./posenet_demo.sh
```
The script will configure the container for you.  Once the build is complete, access the demo using a browser at http://localhost:1234

