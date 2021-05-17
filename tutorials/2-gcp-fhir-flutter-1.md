---
title: "GCP Healthcare API Part 1: Creating FHIR Store"
date: 2021-03-15T15:24:35Z
type: post
author: Grey Faulkenberry, MD MPH
tags: ["Flutter","FHIR","GCP", "Google Healthcare API", "FHIR Store"]
---

## Creating FHIR Store
I've been working on athentication and [authorization for FHIR](https://github.com/MayJuun/fhir/tree/main/fhir_auth) (including SMART, although not solely). And like so many things, it seems harder than it should be. Google has been giving me problems, so as I work through it, I'm going to document my steps, in the hope it will help me (and maybe someone else) in the future.

The first step is that you have to sign up for [Google Cloud Platform](https://cloud.google.com/) (oh yeah, while I really like Google's tools, they're not paying me anything). After you signup, you should be able to go to your console. In the console create a new project. You should be able to do this by clicking on the three little  dots next to Google Cloud Platform (at least that's how mine works, I don't remember if it's different the first time), in the top let corner fo the screeen. My current project is called fhir-fli. 

{{< figure src="/images/fhirfli/2-gcp-fhir-store/project_name.png" width="50%" >}}

Next, you'll need to create a dataset. This is the how-to on [Creating and managing datasets](https://cloud.google.com/healthcare/docs/how-tos/datasets#console). But you could also just skip it and go to the Datasets page.

{{< figure src="/images/fhirfli/2-gcp-fhir-store/healthcare_api.png" width="50%" >}}

Top left corner now looks like this. You'll obviously want to click ENABLE. It will take you to a create datasets page. Fill in whatever name you want your datastore to have, and location type, region, etc. Click CREATE.

{{< figure src="/images/fhirfli/2-gcp-fhir-store/creating.png" width="50%" >}}

Your screen should now look like this. You can click on the title of your dataset. And here is the general [How-To page](https://cloud.google.com/healthcare/docs/how-tos/fhir) for this part.

{{< figure src="/images/fhirfli/2-gcp-fhir-store/create_dataset.png" width="50%" >}}

You should now be here:

{{< figure src="/images/fhirfli/2-gcp-fhir-store/dataset.png" width="50%" >}}

Click CREATE DATA STORE, and you should get the screen below.

{{< figure src="/images/fhirfli/2-gcp-fhir-store/data_store.png" width="50%" >}}

After clicking CREATE, you're done! We're going to be talking about how to access your store in the next section (since I think that's the troublesome one). And if you're not sure, your store exists at:

https://healthcare.googleapis.com/v1/projects/fhirfli/locations/us/datasets/fhirfli/fhirStores/fhirfli

for your specific server, it will be:

https://healthcare.googleapis.com/v1/projects/${PROJECT_ID}/locations/${LOCATION}/datasets/${DATASET_ID}/fhirStores/${FHIR_STORE_ID}

Now that we have setup our server, we can connect our app to it.