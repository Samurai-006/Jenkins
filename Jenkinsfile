pipeline {
    agent any
    stages {    
        stage('Build and Test Model'){
            steps{
                echo "Building Model..."
                bat 'omc model.mos"'
                echo "Test completed!!!"
            }
        }
        stage('Encrypt Modelica Library') {
            steps {
                echo "Encrypting..."
                bat '''
                docker run --rm -v "%cd%:/workspace" semla-agent \
                bash -c "cd /workspace && /opt/SEMLA/src/build/packagetool \
                -language 4.1.0 \
                -librarypath Library \
                -version 1.0.0 \
                -encrypt True"
                '''
            }
        }
    }
}
