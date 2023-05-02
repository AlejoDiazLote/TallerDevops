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
           sh 'mkdir -p logs'
           sh 'pylint ./rp-portfolio > /logs/pylint-logs.txt || true'
          }
      }
     stage('run') {
        steps {
            sh """
                 sh 'cp -r ./ro-portfolio/* /deploy'
            """
            }
          }
   }
}

