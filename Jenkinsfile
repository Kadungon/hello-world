// Powered by Infostretch 

timestamps {

node ('master') { 

	stage ('convert - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'cf4e916c-805a-456f-b1ea-45772844139b', url: 'https://github.com/Kadungon/hello-world.git']]]) 
	}
	stage ('convert - Build') {
 			// Maven build step
	withMaven { 
 			if(isUnix()) {
 				sh "mvn clean package " 
			} else { 
 				bat "mvn clean package " 
			} 
 		} 
	}
	stage ('same - Build') {
 			// Shell build step
sh """ 
sum=$((25 + 25))
echo "The sum is = $sum" 
 """		// Shell build step
sh """ 
 
 """ 
	}
}
}