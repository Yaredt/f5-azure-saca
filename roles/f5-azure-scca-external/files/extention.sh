"### START (INPUT) CUSTOM CONFIGURATION HERE


location=$(curl  --interface mgmt -H metadata:true "http://169.254.169.254/metadata/instance?api-version=2017-08-01" --stderr /dev/null |jq .compute.location)\n#location=""usgovvirginia""\necho $location | grep -i -E "(gov|dod)" > /dev/null;
#echo $?\nif [ $? == 0 ]
then
    curl https://raw.githubusercontent.com/chen23/f5-cloud-libs-azure/chen-azureusgovernment-1.5/scripts/failoverProvider.js > /config/cloud/azure/node_modules/f5-cloud-libs/node_modules/f5-cloud-libs-azure/scripts/failoverProvider.js
else  

    curl https://raw.githubusercontent.com/chen23/f5-cloud-libs-azure/chen-1.5/scripts/failoverProvider.js > /config/cloud/azure/node_modules/f5-cloud-libs/node_modules/f5-cloud-libs-azure/scripts/failoverProvider.js
fi

f5-rest-node /config/cloud/azure/node_modules/f5-cloud-libs/node_modules/f5-cloud-libs-azure/scripts/failoverProvider.js