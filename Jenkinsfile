pipeline {
    agent any 
    stages {
      stage('Cloning repo') {
        steps {
            git branch: 'main', url: 'https://github.com/AlejoDiazLote/TallerDevops'
            }
          }
      
      stage('pylint') {
        steps {
           sh 'pip install pylint'
           sh 'pylint ./rp-portfolio > /logs/pylint-logs.txt || true'
          }
      }
     stage('run') {
        steps {
            sh """
                 
            """
            }
          }
   }
}

