pipeline {
    agent {
        label 'nodejs8'
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

                sh """
                    npm install ; \
                    $(npm bin)/ng build --base-href src
                """

                sh 'oc start-build hello-openshift-app-docker --from-dir .'
                openshiftVerifyBuild bldCfg: "hello-openshift-app-docker", namespace: "hello-openshift-2", waitTime: '20', waitUnit: 'min'

            }
        }
    }
}