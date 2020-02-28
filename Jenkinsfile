node{
    stage('GIT CHECKOUT')
    {
        git credentialsId: 'c538eaed-3163-406a-9594-5b23c6cbfe50', url: 'https://github.com/vidhi-mangukia/IGNITECH'
    }
    
    stage('BUILD Application')
    {
        dir('/root/.jenkins/workspace/demo')
        {
            sh 'gcc calculator.c -o exec_calculator_${BUILD_NUMBER}'
        }
    }
    
    stage('BUILD Docker Image')
    {
        dir('/root/.jenkins/workspace/demo')
        {
            sh 'docker build -t 172.25.50.27:8082/repository/ignitech/exec_calculator:${BUILD_NUMBER} .'
        }
    }
    
    
    stage('Nexus Push Docker Image')
    {
        dir('/root/.jenkins/workspace/demo')
        {
            sh 'docker push 172.25.50.27:8082/repository/ignitech/exec_calculator:${BUILD_NUMBER} '
        }
    }
    
    stage('Nexus Pull Docker Image')
    {
        dir('/root/.jenkins/workspace/demo')
        {
            sh 'docker pull 172.25.50.27:8082/repository/ignitech/exec_calculator:${BUILD_NUMBER} '
        }
    }
    
    stage('Docker Run & Deploy')
    {
        dir('/root/.jenkins/workspace/demo')
        {
            sh 'docker run -d 172.25.50.27:8082/repository/ignitech/exec_calculator:${BUILD_NUMBER} bash'
        }
    }
    
    
    
}
