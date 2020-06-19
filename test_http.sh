#!/bin/bash

echo "Which host do you want to check"
read -p '> ' server_hostname

for method in GET OPTIONS HEAD POST PUT DELETE TRACE CONNECT; do
    echo -e "\n\nTrying $method\n\n"
    echo -e "$method / HTTP/1.1\nHost: $server_hostname\nConnection: close\n\n" | nc $server_hostname 80 | head
    sleep 2
done
