---
title: "GCP Healthcare API Part 2: Attempting Authentication"
date: 2021-03-15T15:24:35Z
type: post
author: Grey Faulkenberry, MD MPH
tags: ["Flutter","FHIR","GCP", "Google Healthcare API", "FHIR Store"]
---

## GCP Healthcare API - Attempting Authentication

Again, I've found this to be tricky, hence why I'm documenting here, to hopefully make it easier for someone else. Remember, we should now have a FHIR store. The one I've setup exists at:

https://healthcare.googleapis.com/v1/projects/fhir-fli/locations/us/datasets/fhir-fli/fhirStores/fhir-fli

So I've probably thrown these words around and not completely understanding the difference, so, for your edification:

- Authentication: who you are
- Authorization: what you can do
- Auditing logs: what you did

This comes from Google's page on [Authentication](https://cloud.google.com/docs/authentication). I think we should use OAuth 2.0 client (partly because that's what SMART and most other authentication processes use), and because, it's for, Accessing private data  on behalf of an end user. Sounds exactly what we're looking for. And google has an [Authenticating as an end user page](https://cloud.google.com/docs/authentication/end-user). It suggests we go to the IAM section of our project. Mine looks like this.

{{< figure src="/images/fhirfli/3-gcp-fhir-store/permissions.png" width="50%" >}}

Clicking on ROLES and ADD, and then searching FHIR, gives me these options. I decided to go for Editor.

{{< figure src="/images/fhirfli/3-gcp-fhir-store/roles.png" width="50%" >}}

After this, go to the top left hamburger, and select APIs & Services, then go to Oauth consent screen. If you have an organization you can choose internal, but in order to test it, I'm going to choose external.

{{< figure src="/images/fhirfli/3-gcp-fhir-store/external.png" width="50%" >}}

Fill out the information on the next page. Make sure you fill out all with a * (they're mandatory!).

{{< figure src="/images/fhirfli/3-gcp-fhir-store/registration.png" width="50%" >}}

Click ADD OR REMOVE SCOPES, and add Cloud Healthcare API (you can just search for health). 

{{< figure src="/images/fhirfli/3-gcp-fhir-store/scopes.png" width="50%" >}}

Next page you can add users (this is done by their email). If you selected internal, they will need to have an email within the domain of your organization. Then review, and go BACK TO DASHBOARD and select Credentials -> +CREATE CREDENTIALS -> OAuth client ID.

