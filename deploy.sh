
subscriptionId=$(az account show --output tsv --query id)
location="westeurope"

acs-engine deploy --subscription-id $subscriptionId \
    --location $location \
    --auto-suffix \
    --api-model k8s.json  \
    2>&1 | tee ./.deploy.output


green='\e[0;32m'
end='\e[0m'

dirname=$(find -maxdepth 2 -type d -name 'kubecon-*' -printf "%f")
target=$(grep -c $dirname ./.deploy.output)
if [ $target -gt 0 ]; then 
    echo -e "${green} Setting kubeconfig file for you$end"
    export KUBECONFIG=$(pwd)/_output/$dirname/kubeconfig/kubeconfig.$location.json
else
    echo "${green} I can't determine your kubeconfig file, please check into _output dir and set the variable export KUBECONFIG=\$configfile $end"
fi

echo -e "${green} Run kubectl cluster-info to verify you have access to the k8s api $end"
