#!groovy
pipeline {

    //execute this Pipeline, or stage, on any available agent.
    agent any

    //specifying global execution timeout of one hour, after which Jenkins will abort the Pipeline run.
    options {
        timeout(time: 1, unit: 'HOURS')
    }

    //specifying variables for all stages
    environment {
        //project vars
        PROJECT_SCRATCH_PATH = "./config/project-scratch-def.json"
        SCRATCH_ORG_NAME     = "diag2_ci_test"
        PERMISSION_SET       = "diag_2_admin"
        CC_4_6_ID            = "04t0V000001Dyaf"
        USER_NAME            = "User"

        //Jenkins env vars
        SERIAL = System.currentTimeMillis()
        BRANCH = "https://github.com/UsamaKhalid024/MySalesforce-LocalRepo-.git"

        }

    stages {

        stage("Checkout source") {
            steps {
                checkout scm
            }
        }

        stage("Run build") {
            steps {
                withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: "JWT_KEY_FILE")]) {

                    script {
                        echo "on branch name: ${BRANCH}"
                        echo "SFDX Home is: ${SFDX_HOME}"
                        echo "${CONNECTED_APP_CONSUMER_KEY}"
                        echo "${HUB_ORG}"
                        echo "${JWT_KEY_FILE}"
                        echo "${SFDC_HOST}"
                        echo "1. DEV HUB auth"
                        def authStatus = bat returnStatus: true, script: "${SFDX_HOME}/sfdx force:auth:jwt:grant -i ${CONNECTED_APP_CONSUMER_KEY} -u ${HUB_ORG} -f ${JWT_KEY_FILE} -s -r ${SFDC_HOST} --json --loglevel debug"
                        if (authStatus != 0) {
                            error "DEV HUB authorization failed"
                        } else {
                            echo "Successfully authorized to DEV HUB ${HUB_ORG}"
                        }
                    }

                }
            }
        }

    }

    post {
        success {
            echo "Pipeline successfully executed!"
        }
        failure {
            echo "Pipeline execution failed!"
        }
    }
}