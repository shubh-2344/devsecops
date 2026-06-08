pipeline{
    agent any
     environment {
        MAVEN_HOME = '/opt/apache-maven-3.9.14/'
        PATH = "${MAVEN_HOME}/bin:${env.PATH}"
    }
    stages {
        stage('clone code') {
            steps{
                git branch: 'main',
                url: 'https://github.com/shubh-2344/devsecops.git'
            }
        }
        stage('build stage'){
            steps{
                sh '''cd webapp
                mvn clean package'''
        }
        }

        }
    }
