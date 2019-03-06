#!/bin/bash

# Query A
function queryA() {
  echo 'Querying A ...'
  docker exec cli scripts/query-a.sh
  echo 'Done'
  echo
}


# Query B
function queryB() {
  echo 'Querying B ...'
  docker exec cli scripts/query-b.sh
  echo 'Done'
  echo
}


# Perform transaction A to B
function AtoB() {
  echo 'Transferring values 10 from A to B ...'
  docker exec cli scripts/invoke-ab.sh
  echo 'Done'
  echo
}


# Perform transaction B to A
function BtoA() {
  echo 'Transferring values 10 from B to A ...'
  docker exec cli scripts/invoke-ba.sh
  echo 'Done'
  echo
}

echo
echo "Perform a transaction on the blockchain network"
echo "-----------------------------------------------"
echo "Chaincode : mycc (Sample chaincode A, B)"
echo "-----------------------------------------------"
echo "1 - Query A"
echo "2 - Query B"
echo "3 - Transfer 10 from A to B"
echo "4 - Transfer 10 from B to A"
echo "5 - Exit !"
echo "-----------------------------------------------"
optline="Please select which option > "
options=("Query A" "Query B" "A to B" "B to A" "Exit")
select yn in "${options[@]}"; do
    case $yn in
        "Query A" ) queryA; break;;
        "Query B" ) queryB; break;;
        "A to B" ) AtoB; break;;
        "B to A" ) BtoA; break;;
        "Exit" ) exit;;
    esac
done
