# CI/CD Pipeline Setup Using AWS and Jenkins with Maven

## [📖 Read the Medium Article for More Info](https://medium.com/@madhurajayashanka/setting-up-a-ci-cd-pipeline-using-aws-and-jenkins-cbfe4fc28c61)

## Overview
This repository contains resources and instructions for setting up a Continuous Integration/Continuous Deployment (CI/CD) pipeline using AWS services and Jenkins with Maven. The pipeline automates the process of building, testing, and deploying software applications, enhancing development efficiency and reliability.

![CI/CD Pipeline Setup Using AWS and Jenkins with Maven
](./Thumbnail.png)


## Components
- **CI Instance (t2.large):** Responsible for building and testing the application, equipped with Java, Jenkins, Maven, and AWS CLI.
- **CD Instance (t2.micro):** Responsible for deploying the built package, equipped with Java and AWS CLI.
- **S3 Bucket (versioning enabled):** Used for version control and storing application artifacts.

## CI/CD Process
1. **GitHub Integration:** Jenkins is connected to the GitHub repository via webhooks, triggering builds on commits.
2. **Build Process:** Maven builds the project in the CI instance, creating a deployable package.
3. **Deployment to S3:** The built package is deployed to the S3 bucket using AWS CLI.
4. **Continuous Deployment:** The CD instance continuously monitors the S3 bucket for new packages, deploying them to the production environment.
5. **Update Deployment:** When a new version is uploaded to S3, the CD instance updates the deployment to the latest version.
6. **Status Display:** CD EC2 CLI displays deployment status and logs.

## Setup Instructions
1. **CI Environment Setup:** Launch an EC2 instance, install dependencies, and configure Jenkins.
2. **Configure Jenkins:** Access Jenkins, create a new pipeline, and configure GitHub webhook integration.
3. **S3 Bucket Setup:** Create an S3 bucket with versioning enabled and configure IAM roles for access.
4. **Jenkins Pipeline Script:** Configure the Jenkinsfile for automated build, test, and deployment stages.
5. **CD Environment Setup:** Launch another EC2 instance for deployment, install dependencies, and execute the Bash script for detecting changes.

## Running the Project
- Execute the provided scripts for setting up CI and CD instances.
- Access Jenkins through the configured port (e.g., `http://[CI_EC2_IP]:8080`) for pipeline management.
- Access the deployed application using the CD instance's IP address and port 8080 (e.g., `http://[CD_EC2_IP]:8080`).

## Conclusion
This project provides a comprehensive guide for setting up a CI/CD pipeline using AWS and Jenkins with Maven. By following the instructions, you can automate the build, test, and deployment processes of your software applications, ensuring efficiency and reliability in your development workflow.

For detailed instructions and resources, refer to the provided medium article 
### [📖 Article](https://medium.com/@madhurajayashanka/setting-up-a-ci-cd-pipeline-using-aws-and-jenkins-cbfe4fc28c61)

