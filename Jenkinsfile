pipeline {
    agent any
    tools{
    maven "maven" 
    }

    
    environment {
        DOCKERHUB_USERNAME ="eyahadrich"
        DOCKERHUB_REPO = "devops"
        TARGET_BRANCH = "main" 
    } 

    stages {
        stage("increment project version")
        {
            steps{
                script{
                sh 'mvn -Dmaven.test.skip=true build-helper:parse-version versions:set\
                    -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} \
                    versions:commit'
                def matcher =  readFile('pom.xml')=~'<version>(.+)</version>'
                def version = matcher[1][1]
                echo "${version}"
                env.IMAGE_NAME= "$version"
                withCredentials([usernamePassword(credentialsId: 'github-auth', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'pwd'
                    sh 'git config --global user.email "jenkins@exemple.com"'
                    sh 'git config --global user.name "jenkins"'
                    sh 'git config --list'
                    sh 'git remote set-url origin  https://${USERNAME}:${PASSWORD}@github.com/eyahadrich/tpAchatProject'
                    sh 'git add .'
                    sh 'git commit -m "update project version"'
                    sh 'git pull origin ${TARGET_BRANCH}'
                    sh 'git branch'
                    sh 'git push origin HEAD:${TARGET_BRANCH}'
                }
            }          
            }
        }
    }
}
