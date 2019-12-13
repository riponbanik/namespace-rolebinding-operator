node {
    
}

pipeline {
   
    agent {
        //label "docker"
        label master
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
