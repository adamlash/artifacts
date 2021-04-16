iothubname=$1
adtname=$2
rgname=$3
egname=$4
location=$5


echo "iot hub name: ${iothubname}"
echo "adt name: ${adtname}"
echo "rg name: ${rgname}"
echo "egname: ${egname}"
echo "location: ${location}"

# echo 'installing azure cli extension'
# az extension add --name azure-iot -y

# echo 'retrieve model'
# curl https://raw.githubusercontent.com/stevebus/stuff/main/models/turbine.json -o turbine.json

# echo 'input model'
# turbineid=$(az dt model create -n $dtname --models turbine.json --query [].id -o tsv)

# echo 'instantiate ADT Instances'
# az dt twin create -n $dtname --dtmi $turbineid --twin-id 'Turbine'


# az eventgrid topic create -g $rgname --name $egname -l $location
# az dt endpoint create eventgrid --dt-name $adtname --eventgrid-resource-group $rgname --eventgrid-topic $egname --endpoint-name "$egname-ep"
# az dt route create --dt-name $adtname --endpoint-name "$egname-ep" --route-name "$egname-rt"
