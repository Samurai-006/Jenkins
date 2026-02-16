pipeline {
    agent any
    stages {    
        stage('Build and Test Model'){
            steps{
                echo "Building Model..."
                bat 'omc -e "loadFile(\\"Library/package.mo\\");simulate(Library.PumpingSystem);"'
                echo "Test completed!!!"
            }
        }
        stage('Encrypt Modelica Library') {
            steps {
                echo "Encrypting..."
                bat '''
                docker run --rm -v "%cd%:/workspace" semla-agent \
                bash -c "cd /workspace && /opt/SEMLA/src/build/packagetool Library"
                '''
            }
        }
    }
}
