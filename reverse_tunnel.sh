#!/bin/bash

# Connect remotely with a reverse tunnel to local
ssh -R 12345:localhost:22 user@server

# Connect to local from remote with the tunnel
# i.e from outside to my server
# ssh -p 12345 <username>@localhost
