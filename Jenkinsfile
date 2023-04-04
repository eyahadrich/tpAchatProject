pipeline {
    agent any
    tools{
    maven "maven" 
    }

    
    environment {
        DOCKERHUB_USERNAME ="eyahadrich"
        DOCKERHUB_REPO = "riadhapps"
        TARGET_BRANCH = "main" // hedi tetbadel selon el branch eli bech truni aleha script
    } 

    stages {
        stage("increment project version")
        {
            steps{
                script{
                sh 'echo hello '
            }          
            }
        }
