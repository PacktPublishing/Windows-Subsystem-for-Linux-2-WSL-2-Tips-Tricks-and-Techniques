# Working with the Azure CLI (az)

This is a sample code to accompany chapter 11, Productivity Tips with Command Line Tools.

This sample deploys a single-file static web site to Azure Web Apps to demonstrate working with the Azure CLI. See https://docs.microsoft.com/en-us/azure/app-service/overview to find out more about running .NET, Node.js, PHP, Java, Python or Ruby apps.

## Create the Web App

Create a resource group and web app:

```bash
WEB_APP_NAME=wsltips$RANDOM
az group create \
        --name wsltips-chapter-11-03 \
        --location westeurope

az appservice plan create \
        --resource-group wsltips-chapter-11-03 \
        --name wsltips-chapter-11-03 \
        --sku FREE

az webapp create \
        --resource-group wsltips-chapter-11-03 \
        --plan wsltips-chapter-11-03 \
        --name $WEB_APP_NAME
```

## Get the Web App URL

```bash
WEB_APP_URL=$(az webapp show \
                --name $WEB_APP_NAME \
                --resource-group wsltips-chapter-11-03 \
                --query "defaultHostName" \
                --output tsv)
echo $WEB_APP_URL
```

## Publish content

Get the credentials for FTP publishing (option 1)
```bash
PUBLISH_URL=$(az webapp deployment list-publishing-profiles \
                --name $WEB_APP_NAME \
                --resource-group wsltips-chapter-11-03 \
                --query "[?publishMethod == 'FTP']|[0].publishUrl" \
                --output tsv)
PUBLISH_USER=$(az webapp deployment list-publishing-profiles \
                --name $WEB_APP_NAME \
                --resource-group wsltips-chapter-11-03 \
                --query "[?publishMethod == 'FTP']|[0].userName" \
                --output tsv)
PUBLISH_PASSWORD=$(az webapp deployment list-publishing-profiles \
                --name $WEB_APP_NAME \
                --resource-group wsltips-chapter-11-03 \
                --query "[?publishMethod == 'FTP']|[0].userPWD" \
                --output tsv)

echo $PUBLISH_URL
echo $PUBLISH_USER
echo $PUBLISH_PASSWORD
```


Get the credentials for FTP publishing (option 2)
```bash
CREDS_TEMP=$(az webapp deployment list-publishing-profiles \
                --name $WEB_APP_NAME \
                --resource-group wsltips-chapter-11-03 \
                --output json)
PUBLISH_URL=$(echo $CREDS_TEMP | jq "map(select(.publishMethod =="FTP"))[0].publishUrl" -r)
PUBLISH_USER=$(echo $CREDS_TEMP | jq "map(select(.publishMethod =="FTP"))[0].userName" -r)
PUBLISH_PASSWORD=$(echo $CREDS_TEMP | jq "map(select(.publishMethod =="FTP"))[0].userPWD" -r)

echo $PUBLISH_URL
echo $PUBLISH_USER
echo $PUBLISH_PASSWORD
```

Get the credentials for FTP publishing (option 3)
```bash
CREDS_TEMP=($(az webapp deployment list-publishing-profiles \
                --name $WEB_APP_NAME \
                --resource-group wsltips-chapter-11-03 \
                --query "[?publishMethod == 'FTP']|[0].[publishUrl,userName,userPWD]" \
                --output tsv))
PUBLISH_URL=${CREDS_TEMP[0]}
PUBLISH_USER=${CREDS_TEMP[1]}
PUBLISH_PASSWORD=${CREDS_TEMP[2]}

echo $PUBLISH_URL
echo $PUBLISH_USER
echo $PUBLISH_PASSWORD
```


Upload the web content:
```bash
curl -T index.html -u $PUBLISH_USER:$PUBLISH_PASSWORD $PUBLISH_URL/
```

Get the URL for the Web App:
```bash
WEB_APP_URL=$(az webapp show \
                --name $WEB_APP_NAME \
                --resource-group wsltips-chapter-11-03 \
                --query "defaultHostName" \
                --output tsv)
```

Echo the URL (or load in the browser with wslview if you have WSL Utilities installed):
```bash
echo $WEB_APP_URL

wslview https://$WEB_APP_URL
```

## Delete the Web App

To delete the resources once finished:
```bash
az group delete --name wsltips-chapter-11-03
```
