pipeline {
    agent { label 'slave1' }	


	environment {	
		DOCKERHUB_CREDENTIALS=credentials('dockerid')
	} 
    
    stages {
        stage('SCM Checkout') {
            steps {
                // Get some code from a GitHub repository
             git 'https://github.com/LoksaiETA/BankingApp.git'
            }
		   }
       stage("Docker build"){
            steps {
				sh 'docker version'
				sh "docker build -t danish1998/wisecow-eta-app:${BUILD_NUMBER} ."
				sh 'docker image list'
				sh "docker tag danish1998/wisecow-eta-app:${BUILD_NUMBER} danish1998/wisecow-eta-app:latest"
            }
        }
		stage('Login2DockerHub') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
		      	}
	    	}
		stage('Push2DockerHub') {

			steps {
				sh "docker push danish1998/wisecow-eta-app:latest"
		      	}
    		}
        stage('Deploy to Kubernetes Dev Environment') {
            steps {
		script {
		sshPublisher(publishers: [sshPublisherDesc(configName: 'Deploy_Server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'kubectl apply -f kubernetesdeploy.yaml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '*.yaml')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
	        }
        }
    	}
    }
  }
