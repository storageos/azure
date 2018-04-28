#!/bin/bash

dir=$(find -maxdepth 2 -type d -name 'kubecon-*' )
resourcegroup=$(grep -o `echo $dir | cut -d'/' -f3` ./.deploy.output | uniq)

if [ ! -z $resourcegroup ]; then
    echo "You can delete the whole cluster by executing the following command:"
    echo -e "az group delete -n $resourcegroup"
else 
    echo "I can't find the resource group name. Checkout the name under _output dir"
fi
