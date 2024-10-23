pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code from your repository
                script {
                    git branch: 'main', url: 'https://github.com/thiruhari/ci-cd-portfolio.git'
                }
            }
        }
        
        stage('Build') {
            steps {
                // Use Maven to build your project
                dir('springboot-app') {
                    sh 'mvn -f pom.xml clean package'
                }
            }
        }
        
        stage('Upload to S3') {
            steps {
                script {
                    // Copy the JAR file to the workspace
                    sh 'cp springboot-app/target/*.jar $WORKSPACE'
                    
                    // Upload the JAR file to S3 bucket
                    sh 'aws s3 cp $WORKSPACE/*.jar s3://cicdbucket-for-testing/'
                }
            }
        }
    }
}
