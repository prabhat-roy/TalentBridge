package talentbridge.analytics.equity

import future.keywords.if
import future.keywords.in

# Pay-equity / diversity / engagement analytics outputs MUST be k-anonymous (k>=5).
# Every aggregate row in input.report.rows must have group_size >= 5.
# Failing rows must be suppressed before publishing.

K_ANONYMITY_THRESHOLD := 5

default allow := true

deny[msg] if {
    row := input.report.rows[_]
    row.group_size < K_ANONYMITY_THRESHOLD
    msg := sprintf(
        "row %v has group_size=%d < k=%d — would identify employees; suppress this slice",
        [row.bucket, row.group_size, K_ANONYMITY_THRESHOLD]
    )
}

# Disallow PII columns in any analytics output (employee_id, name, email, national_id).
disallowed_columns := {"employee_id","name","email","national_id","ssn","aadhaar","phone"}

deny[msg] if {
    col := input.report.columns[_]
    col in disallowed_columns
    msg := sprintf("analytics output may not include PII column %q", [col])
}
