pipeline {
    agent { label "docker-python-agent" }
    stages {
        stage('Build') {
            steps {
                echo "Building..."
                sh '''
                echo "Build stuff happening"
                '''
            }
        }
        stage('Test'){
            steps{
                echo "Testing..."
                sh'''
                echo "Test stuff happens here"
                '''
            }
        }
        stage('Deliver'){
            steps{
                echo "Deliver..."
                sh '''
                echo "Delivering"
                '''
            }
        }
    }
}
