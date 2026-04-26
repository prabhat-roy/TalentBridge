pipeline {
    agent { kubernetes { yamlFile 'ci/jenkins/agent-pod.yaml' } }
    parameters {
        string(name: 'SERVICE',  defaultValue: 'all', description: 'Service name or "all"')
        string(name: 'GIT_REF',  defaultValue: 'main')
    }
    options { timeout(time: 60, unit: 'MINUTES') ; disableConcurrentBuilds() }
    environment { REGISTRY = 'harbor.talentbridge.internal' }
    stages {
        stage('Checkout') { steps { checkout scm } }
        stage('Detect changes') {
            steps {
                script {
                    env.SERVICES = (params.SERVICE == 'all'
                        ? sh(script: "find src -mindepth 2 -maxdepth 2 -type d", returnStdout: true).trim().split('\n').join(',')
                        : "src/" + params.SERVICE)
                }
            }
        }
        stage('Build') {
            steps {
                sh '''#!/usr/bin/env bash
                set -euo pipefail
                IFS=, read -ra SVCS <<< "$SERVICES"
                for s in "${SVCS[@]}"; do
                    echo "::: building $s"
                    (cd "$s" && make build)
                done
                '''
            }
        }
        stage('Test (incl. payroll BigDecimal contract)') { steps { sh 'make test && make payroll-contract-test' } }
        stage('Scan')  { steps { sh 'make scan-images' } }
        stage('Sign')  { steps { sh 'cosign sign --yes ${REGISTRY}/talentbridge/${SERVICE}:${GIT_COMMIT}' } }
        stage('Push')  { steps { sh 'make push' } }
    }
    post { failure { slackSend channel: '#talentbridge-ci', message: "Build failed: ${env.BUILD_URL}" } }
}
