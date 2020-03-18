#!groovy
import groovy.json.JsonSlurperClassic
node {

    def BUILD_NUMBER=env.BUILD_NUMBER
    def RUN_ARTIFACT_DIR="tests/${BUILD_NUMBER}"
    def SFDC_USERNAME

    def HUB_ORG=env.HUB_ORG_DH
    def SFDC_HOST = env.SFDC_HOST_DH
    def JWT_KEY_CRED_ID = env.JWT_CRED_ID_DH
    def CONNECTED_APP_CONSUMER_KEY=env.CONNECTED_APP_CONSUMER_KEY_DH

    println 'KEY IS'
    println JWT_KEY_CRED_ID
    println HUB_ORG
    println SFDC_HOST
    println CONNECTED_APP_CONSUMER_KEY
    def toolbelt = tool 'toolbelt'

    stage('checkout source') {
        // when running in multi-branch job, one must issue this command
        checkout scm
    }

    withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: 'jwt_key_file')]) {
        stage('Authorize to Salesforce') {
            if (isUnix()) {
                rc = sh returnStatus: true, script: "${toolbelt} force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile ${jwt_key_file} --setdefaultdevhubusername --instanceurl ${SFDC_HOST}"
            }else{
                 rc = bat returnStatus: true, script: "sfdx force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --jwtkeyfile C:/openssl/bin/server.key --username ${HUB_ORG} --setdefaultdevhubusername --setalias my-hub-org --instanceurl ${SFDC_HOST}"
            }
            if (rc != 0) { error 'hub org authorization failed' }

			println rc
        }

        /*stage("Convert to mdapi"){
            rc = bat returnStatus: true, script: "mkdir mdapi"
            if (rc != 0) { error 'cannot create mdapi diretory' }
            rc = bat returnStatus: true, script: "sfdx force:source:convert -d mdapi"
            if (rc != 0) { error 'cannot convert source to mdapi' }
        }*/

        stage('Deploye Code'){
            // need to pull out assigned username
            if (isUnix()) {
                rmsg = sh returnStdout: true, script: "${toolbelt} force:mdapi:deploy -d manifest/. -u ${HUB_ORG}"
            }else{
                rmsg = bat returnStdout: true, script: "sfdx force:mdapi:deploy -p c:/Usama Khalid/MyStandardOrgData/MySalesforce-LocalRepo-/force-app/main/default/classes/TaskUtil.cls -u ${HUB_ORG}"
            }
        }

        stage('Run Apex Test') {

            timeout(time: 120, unit: 'SECONDS') {
                rc = bat returnStatus: true, script: "sfdx force:apex:test:run -l RunLocalTests --targetusername ${HUB_ORG}"
                if (rc != 0) {
                    error 'apex test run failed'
                }

                /*rc = bat returnStatus: true, script: "sfdx force:apex:test:report -i 7072v0000DZkAnl -u ${HUB_ORG}"
                if (rc != 0) {
                    error 'apex test run failed'
                }*/
            }
        }

        stage('collect results') {
            junit allowEmptyResults: true, testResults: '**/test-results/*.xml'
        }
    }
}