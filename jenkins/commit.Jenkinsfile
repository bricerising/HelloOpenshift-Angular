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

                sh 'oc start-build hello-openshift-app-docker --from-dir .'
                openshiftVerifyBuild bldCfg: "hello-openshift-app-docker", namespace: "hello-openshift-2", waitTime: '20', waitUnit: 'min'

            }
        }
    }
}