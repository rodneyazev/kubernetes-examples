#!/bin/bash
# add portal-noticias INTERNAL IP - kubectl get nodes -o wide
# run -> bash stress.sh 0.001 > out.txt

for i in {1..100000};
do
  curl localhost:30000
  sleep $1
done
