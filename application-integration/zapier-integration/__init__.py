import os

directories = [
    "application-integration",
    "application-integration/after-effects-plugin",
    "application-integration/api-gateway",
    "application-integration/backend-services",
    "application-integration/backend-services/node-app",
    "application-integration/backend-services/python-app",
    "application-integration/marketing-tools-integration",
    "application-integration/marketing-tools-integration/facebook-ads",
    "application-integration/marketing-tools-integration/google-ads",
    "application-integration/marketing-tools-integration/hubspot",
    "application-integration/zapier-integration",
    "compute-resources",
    "compute-resources/compute-engine",
    "compute-resources/kubernetes-engine",
    "data-processing-analytics",
    "data-processing-analytics/bigquery",
    "data-processing-analytics/dataflow",
    "data-processing-analytics/pub-sub",
    "data-synchronization",
    "data-synchronization/apache-kafka",
    "data-synchronization/backup-solutions",
    "data-synchronization/backup-solutions/backup-directory",
    "monitoring-logging",
    "monitoring-logging/alerts",
    "monitoring-logging/stackdriver-logging",
    "monitoring-logging/stackdriver-monitoring",
    "nao-ai-module",
    "networking-security",
    "networking-security/cloud-armor",
    "networking-security/firewall-rules",
    "networking-security/iam-roles",
    "networking-security/vpc-setup",
    "storage-databases",
    "storage-databases/bigtable",
    "storage-databases/cloud-sql",
    "storage-databases/cloud-storage",
    "storage-databases/firestore"
]

for directory in directories:
    init_file_path = os.path.join("/home/mishari_borah/nao-ai-function", directory, "__init__.py")
    with open(init_file_path, 'w') as f:
        pass
