pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Starting build...'
                git 'https://github.com/VedRatan/pipeline.git'
                sh "docker build -t lostlegend2702/pipeline:${env.BUILD_NUMBER}.0 ."
                echo 'Build completed'
            }
        }
        stage('Push') {
            steps {
                echo 'Starting push...'
                sh "docker login -u lostlegend2702 -p password"
                sh "docker push lostlegend2702/pipeline:${env.BUILD_NUMBER}.0"
                echo 'Push completed' 
            }
        }
        stage('Version') {
            steps {
                echo 'Starting update...'
                git 'https://github.com/VedRatan/pipeline-yaml.git'
                sh "sed -i 's|image: lostlegend2702/pipeline:.*|image: lostlegend2702/pipeline:${env.BUILD_NUMBER}.0|' deployment.yaml"
                sh "cat deployment.yaml"
                sh "git config user.name 'Ved Ratan'"
                sh "git config user.email 'vedratan8@gmail.com'"
                sh "git add ."
                sh "git commit -m 'Jenkins build version ${env.BUILD_NUMBER}.0'"
                sh "git config --local credential.helper '!f() { echo username=VedRatan; echo password=PAT; }; f'"
                sh "git push origin master"
                echo 'Update completed'   
            }
        }
    }
}
