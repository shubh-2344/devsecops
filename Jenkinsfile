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
        stage('deploy to tomcat server') {
        steps {
            withCredentials([usernamePassword(
                credentialsId: 'centos-server',
                usernameVariable: 'USER',
                passwordVariable: 'PASS'
            )]) {

                sh '''
                    sshpass -p "$PASS" scp -o StrictHostKeyChecking=no \
                    webapp/target/*.war \
                    $USER@103.81.38.251:/opt/tomcat/webapps/webapp.war
                '''
            }
        }
    }

    }
 }

