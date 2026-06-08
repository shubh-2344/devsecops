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
                stage('deploy to tomcat server'){
                    steps{
                        sshagent(['53716db5-a649-4283-95e4-32ea709fe5a6']){
                            sh '''
                            scp -o StrictHostKeyChecking=no
                            webapp/target/*.war \
                            oyster@103.81.38.251:/opt/tomcat/webapps/webapp.war'
                            '''
                    }

                }
            }
        }

    }
