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
<<<<<<< HEAD
        stage('deploy to tomcat server') {
        steps {
            withCredentials([usernamePassword(
                credentialsId: 'centos-server',
                usernameVariable: 'USER',
                passwordVariable: 'PASS'
            )]) {
=======
                stage('deploy to tomcat server'){
                    steps{
                        withCredentials([usernamePassword(credentialsId: 'centos-server',usernameVarialbe: 'USER',passwordVariable: 'PASS')])
>>>>>>> 6d04fdd6c8407deb95e4aec8ef3b9bf8300a87c7

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

