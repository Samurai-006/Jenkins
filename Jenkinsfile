pipeline {
    agent {
        docker { image 'python-docker-agent:latest' }
    }
    stages {
        stage('Build') {
            steps {
                echo "Building..."
                sh '''
                echo "Build stuff happening"
                python3 --version
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
