output "eks_eu" { value = module.eks_eu.cluster_name }
output "eks_in" { value = module.eks_in.cluster_name }
output "eks_us" { value = module.eks_us.cluster_name }
output "postgres_eu" { value = aws_db_instance.postgres_eu.endpoint  sensitive = true }
output "postgres_in" { value = aws_db_instance.postgres_in.endpoint  sensitive = true }
output "postgres_us" { value = aws_db_instance.postgres_us.endpoint  sensitive = true }
output "kafka_eu_brokers" { value = aws_msk_cluster.kafka_eu.bootstrap_brokers_tls  sensitive = true }
output "kafka_in_brokers" { value = aws_msk_cluster.kafka_in.bootstrap_brokers_tls  sensitive = true }
output "kafka_us_brokers" { value = aws_msk_cluster.kafka_us.bootstrap_brokers_tls  sensitive = true }
output "documents_buckets" { value = { eu = aws_s3_bucket.documents_eu.bucket, in = aws_s3_bucket.documents_in.bucket, us = aws_s3_bucket.documents_us.bucket } }
