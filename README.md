# Event Hubs in Azure
!Work in process!

## Enter Docker container
cd docker
docker build . --tag=azure-image
docker run -itd --rm --name azure --hostname azure -v C:\marko\GitHub\iac-azure:/local-git azure-image
docker exec -it azure bash

### Azure authentication
**az login**
To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code <CODE> to authenticate.
Click on the account in the browser.

If authenticated a JSON output show up in the Docker.

### Export Azure environment variables
Execute the following commands:
**ARM_SUBSCRIPTION_ID=$(az account show --query "{subscriptionId:id}" --output tsv)**
**ARM_CLIENT_SECRET=$(az ad sp create-for-rbac --name http://ServicePrincipalName --role="Contributor" --scopes="/subscriptions/${ARM_SUBSCRIPTION_ID}" | jq -r ".password")**
**ARM_CLIENT_ID=$(az account show --query "{appId:id}" --output tsv)**
**ARM_TENANT_ID=$(az account show | jq -r ".tenantId")**

The environment is now ready for provisioning Azure services with Terraform. Step into `iac-azure/modules` folder and provision the Event Hubs services.