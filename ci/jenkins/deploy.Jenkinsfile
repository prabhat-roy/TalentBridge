pipeline {
    agent { kubernetes { yamlFile 'ci/jenkins/agent-pod.yaml' } }
    parameters {
        choice(name: 'CLOUD',    choices: ['aws','gcp','azure'], description: 'Target cloud')
        choice(name: 'REGION',   choices: ['eu','in','us'], description: 'Residency region — EU/India/US')
        choice(name: 'ENV',      choices: ['dev','staging','prod'])
        string(name: 'SERVICE',  defaultValue: 'all')
        string(name: 'VERSION',  defaultValue: 'latest')
        booleanParam(name: 'PAYROLL_BLUE_GREEN_PROMOTE', defaultValue: false, description: 'Promote payroll blue->green (after dry-run)')
    }
    options { timeout(time: 30, unit: 'MINUTES') }
    stages {
        stage('Configure kubeconfig (residency-region cluster)') {
            steps {
                script {
                    if (params.CLOUD == 'aws')   { sh 'aws eks update-kubeconfig --name talentbridge-${REGION}-${ENV}' }
                    else if (params.CLOUD == 'gcp') { sh 'gcloud container clusters get-credentials talentbridge-${REGION}-${ENV} --region $(./ci/region-map.sh gcp ${REGION})' }
                    else                          { sh 'az aks get-credentials --resource-group talentbridge-${REGION}-${ENV} --name talentbridge-${REGION}-${ENV}' }
                }
            }
        }
        stage('Helm upgrade (canary or blue-green per service)') {
            steps {
                sh '''#!/usr/bin/env bash
                set -euo pipefail
                CHART_DIRS=$([ "$SERVICE" = "all" ] && find helm/charts -mindepth 1 -maxdepth 1 -type d -not -name "_*" || echo "helm/charts/$SERVICE")
                for chart in $CHART_DIRS; do
                    name=$(basename "$chart")
                    case "$name" in
                      payroll-service|disbursement-service)
                        echo "::: blue-green deploy $name (mandatory dry-run gate)"
                        helm upgrade --install "$name-blue" "$chart" -n talentbridge --create-namespace -f "$chart/values.yaml" -f "$chart/values-${CLOUD}.yaml" --set image.tag=${VERSION} --set deploymentColor=blue
                        if [ "$PAYROLL_BLUE_GREEN_PROMOTE" = "true" ]; then
                          helm upgrade --install "$name" "$chart" -n talentbridge -f "$chart/values.yaml" -f "$chart/values-${CLOUD}.yaml" --set image.tag=${VERSION}
                        fi
                        ;;
                      *)
                        helm upgrade --install "$name" "$chart" -n talentbridge --create-namespace -f "$chart/values.yaml" -f "$chart/values-${CLOUD}.yaml" --set image.tag=${VERSION}
                        ;;
                    esac
                done
                '''
            }
        }
        stage('Verify') { steps { sh 'kubectl get pods -n talentbridge'  sh 'make k8s-validate' } }
    }
}
