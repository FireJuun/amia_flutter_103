---
title: "Azure FHIR Setup"
date: 2021-05-16T23:55:03Z
type: post
author: Grey Faulkenberry, MD MPH
tags: ["FHIR","Azure", "Authentication"]
---
# Azure FHIR Setup

Some of you may need to use the Azure FHIR server (my apologies in advance, it cost me $80 over two weeks and then I was like, screw this). However, before I canceled it, I did manage to get authentication to work. I'm not sure all of the settings I've used are required, but this is what I needed to get it to work properly (why is authentication such a pain in the ass?)

After looking through all of the tutorials that were wrong and unhelpful, start here: https://docs.microsoft.com/en-us/azure/healthcare-apis/fhir-paas-portal-quickstart. That will show you how to deploy an Azure FHIR instance, which is the first step. Second step is here. Make sure you make those CORS settings, otherwise you can't access the server.

Alright, onto the next step, registering your app. This tutorial is mostly accurate: On step 4 in the first section, just be sure to put your app's callback/redirectURL. And set the type to Public client/native (mobile & desktop). Make note of both your Application (client) ID and your Directory (tenant) ID. Go onto API Permissions and Add a Permission. There should be 3 options across the top:

**Microsoft APIs** | **APIs my organization uses** | **My APIs**


Click on the middle one and select Azure Healthcare APIs. Click on Delegated Permissions, and select user_impersonation under the Permissions section. Lastly, follow the instructions to get your application secret. You don't need the secretID, just the secret (save it somewhere, because it's only displayed once).

Now, it's time to add some users. Open your Azure Active Directory. Click on Users. Add a New user. Fill out the required fields. Make note that the email address (and login) of this user is name@creatoremail.onmicrosoft.com, I haven't yet been able to signin with an outside email. 

Lastly, go back to your Azure API for FHIR, and click on Access Control (IAM). Click Add -> Add Role Assignment. Under Role, select FHIR Contributor (or whatever you think is appropriate), search for the user in the Select field. After you've chosen, just click Save, and that should be the setup from the server side. It should now work with the normal SMART on FHIR/Oauth2 flow, as long as you have the following items:

clientId = "123456789"
tenantId = "abcdefghi"
clientSecret = jklmnopqrst"
URL of your FHIR API = "https://myamazingfhir.azurehealthcareapis.com"

In addition to these, know that your auth & token urls are as follows:
https://login.microsoftonline.com/$tenantId/oauth2/authorize?resource=$azureUrl
'https://login.microsoftonline.com/$azureTenantId/oauth2/token'

So just to be super clear, for the above values, your urls would be:
https://login.microsoftonline.com/abcdefghi/oauth2/authorize?resource=https://myamazingfhir.azurehealthcareapis.com
'https://login.microsoftonline.com/abcdefghi/oauth2/token'

Lastly, for the time being, you don't need to request scopes when you are making these calls.