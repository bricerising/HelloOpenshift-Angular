pipeline {
    agent {
        label 'master'
    }
    options {
        timeout(time: 20, unit: 'MINUTES')
    }
    node('teracy/angular-cli:1.5.0') {
        stages {
            stage("Checkout") {
                steps {
                    checkout scm
                }
            }

            stage("Build Image") {
                steps {

                    sh """
                        npm install ; \
                        ng build --base-href src
                    """

                    sh 'oc start-build hello-openshift-app-docker --from-dir .'
                    openshiftVerifyBuild bldCfg: "hello-openshift-app-docker", namespace: "hello-openshift-2", waitTime: '20', waitUnit: 'min'

                }
            }
        }
    }
}