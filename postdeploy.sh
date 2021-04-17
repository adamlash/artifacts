iothubname=$1
adtname=$2
rgname=$3
location=$4
egname=$5
egid=$6
funcappid=$7



echo "iot hub name: ${iothubname}"
echo "adt name: ${adtname}"
echo "rg name: ${rgname}"
echo "location: ${location}"
echo "egname: ${egname}"
echo "egid": ${egid}
echo "funcappid": ${funcappid}


# echo 'installing azure cli extension'
# az extension add --name azure-iot -y

# echo 'retrieve model'
curl https://raw.githubusercontent.com/adamlash/artifacts/main/turbine.json -o turbine.json

# echo 'input model'
turbineid=$(az dt model create -n $adtname --models turbine.json --query [].id -o tsv)

# echo 'instantiate ADT Instances'
for i in {98..107}
do
    echo "Create Turbine T$i"
    az dt twin create -n $adtname --dtmi $turbineid --twin-id "T$i"
done


# az eventgrid topic create -g $rgname --name $egname -l $location
az dt endpoint create eventgrid --dt-name $adtname --eventgrid-resource-group $rgname --eventgrid-topic $egname --endpoint-name "$egname-ep"
az dt route create --dt-name $adtname --endpoint-name "$egname-ep" --route-name "$egname-rt"

# Create Subscriptions???
az eventgrid event-subscription create --name "$egname-broadcast-sub" \
    --source-resource-id $egid \
    --endpoint "$funcappid/functions/property --endpoint-type azurefunction
