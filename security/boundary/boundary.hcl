controller {
  name = "controller-1"
  database { url = "postgresql://boundary@postgres-boundary/talentbridge" }
}
worker {
  name = "worker-talentbridge-1"
  controllers = ["controller-1.boundary.talentbridge.internal"]
}
kms "awskms" {
  purpose = "root"
  key_id  = "alias/talentbridge-boundary"
}
