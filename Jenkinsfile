pipeline {
    agent any

    environment {
        MAVEN_HOME = '/opt/apache-maven-3.9.14/'
        PATH = "${MAVEN_HOME}/bin:${env.PATH}"
    }

    stages {

        stage('clone code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/shubh-2344/devsecops.git'
            }
        }
        stage('git secret checks'){
            steps {
                sh 'rm trufflehog || true'
                sh 'docker run gesellix/trufflehog --json https://github.com/shubh-2344/devsecops.git > trufflehog'
                sh 'cat trufflehog'
            }
        }

        stage('owasp dependency check'){
            steps{
                sh 'rm owasp* || true'
                sh 'wget "https://raw.githubusercontent.com/shubh-2344/devsecops/refs/heads/main/owasp-dependency-check.sh" '
                sh 'chmod +x owasp-dependency-check.sh'
                sh 'bash owasp-dependency-check.sh'

            }

        }
        stage('Static application security test'){
            steps {
            dir('webapp') {
            withSonarQubeEnv('sonarqube') {
            sh '''
            mvn sonar:sonar
            cat target/sonar/report-task.txt
            '''
            }
        }
        }
        }
        stage('build stage') {
            steps {
                sh '''
                    cd webapp
                    mvn clean package
                '''
            }
        }

        stage('deploy to tomcat server') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: '5e8700a6-4e0e-4ebb-9cb9-c5cf3177fd9b',
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
