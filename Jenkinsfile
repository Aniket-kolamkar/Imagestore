pipeline { 

    environment { 

        registry = "aniketkolamkar/imagestoreadmin" 

        registryCredential = 'aniketkolamkar' 

        dockerImage = '' 

    }

    agent any 

    stages { 

        // stage('Cloning our Git') { 

        //     steps { 

        //         git 'git@github.com:6simplex/imagestore-admin.git' 

        //     }

        // } 

        stage('Checkout code') {
        steps {
            checkout scm
            // git branch: 'main', url: 'git@github.com:6simplex/imagestore-admin.git'
        }
    }

        stage('Building our image') { 

            steps { 

                script { 

                    // dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                    dockerImage = bat 'docker build -t shanem/spring-petclinic:latest .' 
              }

            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) 
                    // bat "docker-compose up" 
                    { 

                        dockerImage.push() 

                    }

                } 

            }

        } 

        // stage('Cleaning up') { 

        //     steps { 

        //         sh "docker rmi $registry:$BUILD_NUMBER" 

        //     }

        // } 

    }

}


