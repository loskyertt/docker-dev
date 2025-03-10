#!/bin/bash

docker run -itd --name=web-dev --network=host -v $HOME/workspace/web-dev:/root/web-dev node-dev:latest