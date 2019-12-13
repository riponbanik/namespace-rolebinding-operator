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
         export GOROOT=/usr/local/go
         export GOPATH=$WORKSPACE
         export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
         go install .
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
