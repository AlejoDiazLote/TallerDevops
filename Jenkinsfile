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
            sh """
               pwd
               pylint --disable=C0111 --exit-zero rp-portfolio
             """
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

