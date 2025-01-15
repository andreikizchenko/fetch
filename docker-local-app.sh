#!/usr/bin/env bash

# Remove an existing fetch image
docker image remove -f fetch

# Create new fetch image
docker build -t fetch .

# Run docker container
docker run -it --volume $(pwd)/runs:/app/runs:z fetch /bin/bash
