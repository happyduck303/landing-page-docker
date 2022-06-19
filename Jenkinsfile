pipeline {  
  agent { label 'master' }  
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))   
  }
  stages {
    stage('Build Image') {
        steps {
            script {
                if (env.BRANCH_NAME == 'development') {                     
            sh 'docker build -t happyduck/landing-multibranch:0.0.$BUILD_NUMBER-dev .'
                }
                else if (env.BRANCH_NAME == 'staging') {
            sh 'docker build -t happyduck/landing-multibranch:0.0.$BUILD_NUMBER-staging .'
                }
                else if (env.BRANCH_NAME == 'production') {
            sh 'docker build -t happyduck/landing-multibranch:0.0.$BUILD_NUMBER-prod .'   
               }
                else {
                    sh 'echo Nothing to Build'
                }
            }
        }
    }
    stage('Push to Registry') {
        steps {
            script {
             if (env.BRANCH_NAME == 'development') {
            sh 'docker push happyduck/landing-multibranch:0.0.$BUILD_NUMBER-dev'
                }
                else if (env.BRANCH_NAME == 'staging') {
            sh 'docker push happyduck/landing-multibranch:0.0.$BUILD_NUMBER-staging' 
                }
                else if (env.BRANCH_NAME == 'production') {
            sh 'docker push happyduck/landing-multibranch:0.0.$BUILD_NUMBER-prod'
               }
                else {
                    sh 'echo Nothing to Build'
                }

        }
      }
    } 
}
        post {
            success {
                slackSend channel: '#dev-ops',
                color: 'good',
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
            }    

            failure {
                slackSend channel: '#dev-ops',
                color: 'danger',
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
                }

        }
}


