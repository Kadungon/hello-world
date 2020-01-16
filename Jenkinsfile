def buildnumber = "${env.BUILD_NUMBER}"
def appversion = "1.0.0.${buildnumber}"
def mvnHome; 
def mvnCMD;

node('jenkins-slave') {
        stage('SCM Checkout') {
            //git 'https://github.com/Kadungon/hello-world.git'
                checkout scm
        }
        
        stage('Maven Build') {
            
            mvnHome = tool name: 'maven-3',type: 'maven'
            mvnCMD = "${mvnHome}/bin/mvn"
            sh "${mvnCMD} -B clean package -Dapp.version=${appversion}"
            stash includes: 'target/*.war', name: 'builtSources'
        }
        
        stage('Maven Test') {
            
            sh "${mvnCMD} -B clean test -Dapp.version=${appversion}"
            junit 'target/surefire-reports/TEST-*.xml'
            jacoco classPattern: 'target/classes', execPattern: 'target/**.exec', sourcePattern: 'src/main/java'
        }
        
        container('docker') {
        stage('Buid Docker Image') {
            unstash 'builtSources'
            sh "docker build --build-arg APPVERSION=${appversion} -t kadungon/helloworld-app:${appversion} ."
        }
        
        
        stage('Push Docker image'){
            withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'docHubPwd', usernameVariable: 'docHubUser')]) {
                sh "docker login -u ${docHubUser} -p ${docHubPwd}" 
            }  
            
            sh "docker push kadungon/helloworld-app:${appversion}"
        }
        }
        
        container('kubectl'){
        stage('Deploy to K8'){
            withKubeConfig(credentialsId: 'kube-deploy', serverUrl: 'https://10.134.95.70:6443') {
                sh 'kubectl apply -f k8/helloworld-app.yaml'
            }
        }
        
    
        }
        
        
}
