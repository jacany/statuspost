#!/bin/bash

declare authorization="statuspage_api_key"

declare -A address0=(
    [port]="80"
    [status]="statuspage_url"
    [degraded]="major_outage"
)

declare -A address1=(
    [port]="1204"
    [status]="statuspage_url"
    [degraded]="major_outage"
)


declare -n address

for address in "${!address@}"
do
    echo "${address[port]}"
    if (lsof -i:${address[port]} | grep -q LISTEN); then
        curl ${address[status]} \
            -H "Authorization: ${authorization}" \
            -X PATCH \
            -d "component[status]=operational"
    else
        curl ${address[status]} \
            -H "Authorization: ${authorization}" \
            -X PATCH \
            -d "component[status]=${address[degraded]}"
    fi
done
