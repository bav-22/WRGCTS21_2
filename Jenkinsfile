@Library('piper-lib-os') _ 

pipeline {
    agent any
    stages {
        stage ('Setup') {
            steps {
                setupCommonPipelineEnvironment script: this
            }
        }
        stage ('Deploy Commit') {
            steps {
                gctsDeploy script: this
            }
        }
        stage ('Run Unit Tests') {
            steps {
                script {
                    checks_failed = false
                    try {
                        gctsExecuteABAPUnitTests script: this
                    } catch (err) {
                        unstable('AUnit test failed!') 
                        checks_failed = true
                    }
                }
            }
        }
        stage ('Run ATC Checks') {
            steps {
                script {
                    abapEnvironmentRunATCCheck script: this
                    def checkstyle = scanForIssues tool: checkStyle(pattern: 'ATCResults.xml')
                    publishIssues issues: [checkstyle], failedTotalAll: 1 //, failOnError: true
                    if ( currentBuild.result == 'FAILURE' ) {
                        echo 'ATC check failed!'
                        check_failed = true
                    }
                }    
            }    
        }    
        stage ('Rollback Commit') {
            when { expression { checks_failed == true } }
            steps {
                gctsRollback script: this
            }
        }
        stage ('Success build') {
            when { expression { checks_failed == false } }
            steps {
                echo 'Build Success!'
            }
        }
    }
}
