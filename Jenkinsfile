node {
  stage('SCM') {
    checkout scm
  }
  
  stage('SonarQube Analysis') {
    sh "chmod 777 analyze.sh"
    sh "./analyze.sh"
  }
}
