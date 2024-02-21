#!/bin/bash

echo "------------------------------------------------------------------
                        Script by Vishwas Dave
                        Simple shell script to 
                        get all subdomain from
                        crt.sh
------------------------------------------------------------------
"
USAGE1="Usage: ./cert.sh domain"
help_text="Tool for resolved chrome certificate error in Android"
domain=$1
RED="\033[1;31m"
GREEN="\033[0;32m" 
RESET="\033[0m"

function get_subdomains(){
    echo -e "${GREEN} Getting all subdomain ... ${RESET}"
    curl https://crt.sh/?CN=%25.$domain | grep $domain | tee domlist.txt >&-
    cat domlist.txt | cut -b 9- | rev | cut -c6- | rev | tee sublist.txt >&-
    cat sublist.txt | sort -u | tee subdomains.txt >&-
    rm domlist.txt sublist.txt >&-
}

if [ $# == 1 ] ; then 
    get_subdomains
    echo -e "${GREEN} [+] Task Complete ${RESET}"
else
    echo -e "${RED}".$USAGE1."${RESET}"
    exit 1;
fi
