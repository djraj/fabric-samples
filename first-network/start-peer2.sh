# Generate crypto files
echo 'Generating crypto materials'
cryptogen extend --config=./crypto-config2.yaml
echo 'Done generating...'

# Spawining containers
echo 'Creating Peer2 and CouchDB4'
docker-compose -f docker-compose-peer2.yaml up -d
echo 'Done creating containers...'

# Join peer to channel
echo "Joining 'peer2.org2.example.com' to 'mychannel'"
docker exec cli scripts/peer2-joinchannel.sh
echo 'Completed !'
