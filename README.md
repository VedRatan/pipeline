# Step 1
Create a basic application that you want to deploy using pipeline.
We have created a go server, main.go and go.mod.

# Step 2
Now create a Dockerfile that will build the image and test it locally.

# Step 3
Create a new Jenkins image so that docker can work in it.
```
FROM jenkins/jenkins:lts
USER root
RUN apt-get update
RUN curl -sSL https://get.docker.com/ | sh
```
And run this image using the command
```
sudo docker run -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock go/jenkins:latest
```
go/jenkins:latest is the name of the built image in our case.

# Step 4
Setup Jenkins dashboard

# Step 5
Create a new Pipeline project in Jenkins and enable GitSCM polling to integrate with GitHub webhooks.
Add the Jenkinsfile to the script to create the pipeline steps and initialize the pipeline.

# Step 6
Expose your localhost port 8080 which is running Jenkins to the internet using ngrok.
'''
ngrok http 8080
'''
Verify the link provided if it is now accessible.

# Step 7
Go to your GitHub project of your application and in settings add a new webhook with the ngrok url and add '/github-webhook/' at the end of the url, enable webhook to run on pushes, PRs and commits.

# Step 8
Now startup minikube and install ArgoCD using the official documentation and create a new app that links to your other repo which will include all k8s config yaml files for GitOps.

# Step 9
Simply expose your service using the minikube official documentation.
'''
minikube service pipeline-service --url
'''