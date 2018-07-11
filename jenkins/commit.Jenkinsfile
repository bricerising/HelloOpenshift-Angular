pipeline {
    agent {
        label 'master'
    }
    options {
        timeout(time: 20, unit: 'MINUTES')
    }
    stages {
        stage("Checkout") {
            steps {
                checkout scm
            }
        }

        stage("Build Image") {
            steps {

                sh 'ng build'
                sh 'oc start-build hello-openshift-app --from-dir .'
                openshiftVerifyBuild bldCfg: "hello-openshift-app", namespace: "hello-openshift", waitTime: '20', waitUnit: 'min'
            }
        }

        stage("Deploy") {
            steps {
                openshiftDeploy depCfg: "greenengage-app", namespace: "hello-openshift"
            }
        }
    }
}