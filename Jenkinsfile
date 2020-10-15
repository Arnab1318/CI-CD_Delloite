#!/usr/bin/env groovy
 
import hudson.model.*
import hudson.EnvVars
import groovy.json.JsonSlurperClassic
import groovy.json.JsonBuilder
import groovy.json.JsonOutput
import java.net.URL

try {
    
node{

  stage('Checkout') {
    git 'https://github.com/Arnab1318/CI-CD_Delloite'
  }
  stage('Build') {
      withMaven(jdk: 'JAVA_HOME', maven: 'M2_HOME') {
        sh 'mvn clean compile package'
      }
  }
}// node
} // try end
finally {
     
 (currentBuild.result != "ABORTED") && node("master") {
         // Send e-mail notifications for failed or unstable builds.
     // currentBuild.result must be non-null for this step to work.
     step([$class: 'Mailer',
        notifyEveryUnstableBuild: true,
        recipients: 'arnab13.naskar#gmail.com',
        sendToIndividuals: true])
 }
}
