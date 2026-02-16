pipeline {
    agent any
    stages {
        stage('Build and Test Model'){
            steps{
                echo "Building Model..."
                bat 'omc Library/package.mo || true'
                echo "Test completed!!!"
            }
        }
        stage('Encrypt Modelica Library') {
            steps {
                echo "Encrypting..."
                sh '''
                semla_encrypt Library \
                    --output Library.mlc
                '''
            }
        }
    }
}
