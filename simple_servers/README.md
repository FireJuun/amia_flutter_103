# servers
This is a simple repo because I was tired of trying to remember everytime how to host a flutter project on a server. I've put simple examples of two different servers here. Both very small and lightweight. 

## Quick shout outs to the following people for making my life much easier for this:
- [Jermaine Oppong YouTube Tutorial](https://www.youtube.com/watch?v=y6Z1V8QpGFc)
- [Nick Manning YouTube Tutorial](https://www.youtube.com/watch?v=SIDOSAdevWM)
- [Tony Pujals - Google Engineer](https://medium.com/google-cloud/build-slim-docker-images-for-dart-apps-ee98ea1d1cf7)

## Get Server
This uses the [get_server](https://pub.dev/packages/get_server) package.
```dart
void main() => runApp(
      GetServer(
        home: FolderWidget('app/web'),
        getPages: [
          GetPage(
            name: '/',
            page: () => Html(path: 'app/web/index.html'),
          ),
          GetPage(
            name: '/redirect',
            page: () => Html(path: 'app/web/index.html'),
          ),
        ],
        onNotFound: Html(path: 'app/web/index.html'),
      ),
    );
```
- Note that the ```home``` argument is required (it tells the server where to look for the web folder). The ```GetPage``` and ```onNotFound``` specify a path to a webpage (which for us is all the same). 

## Shelf Server
This uses primarily [shelf](https://pub.dev/packages/shelf) but also [functions_framework](https://github.com/GoogleCloudPlatform/functions-framework-dart). 
```dart
Future<void> main(List<String> args) async {
  await serve(args, _nameToFunctionTarget);
}

FunctionTarget? _nameToFunctionTarget(String name) {
  switch (name) {
    case 'function':
      return FunctionTarget.http(
        createStaticHandler('app/web', defaultDocument: 'index.html'),
      );
    default:
      return null;
  }
}
```
## Directory
- It is important to pay attention to the path for both of these servers. We specify ```app/web``` because this is the directory in the Docker container. If you want to run this directly without Docker, you need to change it to simply ```web```.

## Flutter Project
- Remember, these simple servers are designed solely to host your Flutter web project. They both use the same setup, including the same Docker file. 

## Docker - how to setup the docker container
1. Ensure docker is installed, to check run:  
```$ docker run hello-world```
2. Take a flutter project that's ready for web deployment
3. In the root of that directory, run  
```$ flutter build web```
4. Copy the contents of folder ```build/web``` (NOT the web folder - that would be too obvious) to the folder ```web``` in the server - currently they just hold an example of the startup app
5. Paste the contents into the ```web``` folder (overwrite what is there now, although if you want to use the workflow of having OAuth done in an external window, I've kept the redirect.html file in the web folder that you may use, read more about [that here](https://itnext.io/flutter-web-oauth-authentication-through-external-window-d890a7ff6463))
6. From the root of the server project, run the following:  
```$ docker build -t projectName .```
7. Test it:    
```$ docker run -d -p 8080:8080 projectName```

## Google Cloud 
1. Get Google Cloud account
2. Create Project
3. Note Project ID
4. Enable Container Registry & Cloud Run APIs
5. Initialize gcloud  
```$ gcloud init```
6. Configure docker for gcloud  
```$ gcloud auth configure-docker```
7. Build container in Google Cloud Container Registry  
```$ docker build -t gcr.io/projectId/projectName:version .```  
8. For the above, the projectId is your GCP project ID, the projectName is the name of the docker file that we had above, and the version is however you want to define versions in the cloud so in the future you'll know which is which. For instance, if our GCP project Id is ```new-project-123456``` our docker project was called ```docker-project```, we would write:  
```$ docker build -t gcr.io/new-project-123456/docker-project:v0.1 .```

9. Push container to cloud  
```$ docker push gcr.io/projectId/projectNam:version```
10. If you go to your GCP console and open the Container Registry, you should see the container that you just pushed
11. Open Cloud Run in your GCP Console
12. Create Service, choose your service name, and pick your Region
13. Select ```Deploy one revision from an existing container image```, and choose the image you just uploaded
14. Click on Advanced Settings, and under Capacity, change the Memory allocated to ```1 GiB```
15. For testing purposes
- Ingress: Allow all traffic
- Authentication: Allow unauthenticated invocations
16. Create!
17. When finished, you will see a URL that will now be hosting your flutter web app