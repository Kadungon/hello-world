node('jenkins-slave') {
        stage('SCM Checkout') {
            git 'https://github.com/Kadungon/hello-world.git'
        }
        
        stage('Build a Maven project') {
            def mvnHome = tool name: 'maven-3',type: 'maven'
            def mvnCMD = "${mvnHome}/bin/mvn"
            sh "${mvnCMD} -B clean install"
        }
        
        container('docker') {
        stage('Buid Docker Image') {
            sh 'docker build -t kadungon/helloworld-app:1.0.0 .'
        }
        
        stage('Push Docker image'){
            withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'docHubPwd', usernameVariable: 'docHubUser')]) {
                sh "docker login -u ${docHubUser} -p ${docHubPwd}" 
            }  
            
            sh 'docker push kadungon/helloworld-app:1.0.0'
        }
        }
            
        
}
