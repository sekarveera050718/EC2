EC2 Provisioning, Deployment and Termination with Jenkins and Terraform
=======================

Experimenting with a jenkins pipeline that: provisions a Tomcat EC2 instance, deploys a sample.war to it, and terminates the instance and the end.

Requirements
------------

- AWS private key
- File containing the Tomcat user and password to be used for deployment (i.e. ~/.tomcat_creds.groovy)
- Shared credentials file with AWS keys (default location: ~/.aws/credentials)
- Jenkins pipeline with 'Pipeline script from SCM'

Dependencies
------------

AWS (Free Tier) account.
