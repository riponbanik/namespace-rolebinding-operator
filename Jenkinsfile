node {
    
}

pipeline {
   
    agent {
        label "docker"
    }    
   
   stages { 
     stage ("Build") {
       steps {     
         sh '''
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
