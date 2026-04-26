package talentbridge.residency

import future.keywords.if
import future.keywords.in

# Enforces: a Pod whose data-class is employee-pii must run in a cluster
# whose talentbridge.io/region label matches the employee's residency region.
# Kyverno / Gatekeeper drives the AdmissionReview into this policy.

default allow := true

# 1. EU employee data may only land in EU clusters.
deny[msg] if {
    pod := input.request.object
    pod.metadata.labels["talentbridge.io/data-class"] == "employee-pii"
    pod.metadata.labels["talentbridge.io/employee-region"] == "eu"
    cluster_region := input.cluster.labels["talentbridge.io/region"]
    cluster_region != "eu"
    msg := sprintf("EU employee PII pod %q cannot run in cluster region %q (must be EU)", [pod.metadata.name, cluster_region])
}

# 2. India employee data may only land in India clusters.
deny[msg] if {
    pod := input.request.object
    pod.metadata.labels["talentbridge.io/data-class"] == "employee-pii"
    pod.metadata.labels["talentbridge.io/employee-region"] == "in"
    cluster_region := input.cluster.labels["talentbridge.io/region"]
    cluster_region != "in"
    msg := sprintf("India employee PII pod %q cannot run in cluster region %q (must be IN)", [pod.metadata.name, cluster_region])
}

# 3. US employee data may only land in US clusters.
deny[msg] if {
    pod := input.request.object
    pod.metadata.labels["talentbridge.io/data-class"] == "employee-pii"
    pod.metadata.labels["talentbridge.io/employee-region"] == "us"
    cluster_region := input.cluster.labels["talentbridge.io/region"]
    cluster_region != "us"
    msg := sprintf("US employee PII pod %q cannot run in cluster region %q (must be US)", [pod.metadata.name, cluster_region])
}

# 4. PII workloads MUST advertise a residency-region label — defense in depth.
deny[msg] if {
    pod := input.request.object
    pod.metadata.labels["talentbridge.io/data-class"] == "employee-pii"
    not pod.metadata.labels["talentbridge.io/employee-region"]
    msg := sprintf("PII pod %q is missing talentbridge.io/employee-region label", [pod.metadata.name])
}

# 5. Database connection strings cross-checked: a pod must not declare an env var
#    that points at an out-of-region database hostname.
deny[msg] if {
    pod := input.request.object
    pod.metadata.labels["talentbridge.io/data-class"] == "employee-pii"
    container := pod.spec.containers[_]
    env := container.env[_]
    env.name == "POSTGRES_HOST"
    cluster_region := input.cluster.labels["talentbridge.io/region"]
    not contains(env.value, cluster_region)
    msg := sprintf("PII container %q connects to %q which is outside cluster region %q", [container.name, env.value, cluster_region])
}
