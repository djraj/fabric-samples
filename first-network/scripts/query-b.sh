#!/bin/sh

# Query value of A
peer chaincode query -C mychannel -n mycc -c '{"Args":["query","b"]}'
