node {
    
}

pipeline {
   
    agent {
        //label "docker"
        label "master"
    }    
   
   stages { 
     stage ("Build") {
       steps {     
         sh '''
         mkdir -p /var/jenkins_home/workspace/gobuild
         export GOROOT=/usr/local/go
         export GOPATH=/var/jenkins_home/workspace/gobuild
         export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
         # export GO111MODULE=off
         go mod tidy
         make build
         '''
       } 
     }
     stage ("Deploy") {
       steps {     
         sh '''
         ./bin/namespace-rolebinding-operator --run-outside-cluster 1
         '''
       }
     }
   }
 }
