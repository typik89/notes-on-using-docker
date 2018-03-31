az storage account create -n aksvolumestorageaccount -g aksGroup -l westeurope --sku Standard_LRS

az storage share create -n jetty-share --debug --account-name aksvolumestorageaccount --quota 1

az storage account keys list --resource-group aksGroup --account-name aksvolumestorageaccount --query "[0].value" -o tsv
kubectl create secret generic azure-file-share-secret --from-literal=azurestorageaccountname=aksvolumestorageaccount --from-literal=azurestorageaccountkey=C4/9wJPxhhBQPt9nlc3eZThwxo3xVgQIyIIzearS3EDn1A3cqSnCPFk4Ry6JRGRtJqrxXVZx1M9eTUSx6zIp2g==

kubectl apply -f share.yaml