#!/usr/bin/env groovy
@Library('sfdx-jenkins-shared-library')
import com.claimvantage.sjsl.Help
import com.claimvantage.sjsl.Org
import com.claimvantage.sjsl.Package

node {
    stage("checkout") {
        ...
    }
    withOrgsInParallel() { org ->
        stage("${org.name} create") {
            createScratchOrg org
        }
        ...
    }
    stage("publish") {
        ...
    }
}