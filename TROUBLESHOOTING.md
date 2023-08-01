# Troubleshooting Common Issues

## Once cuegui is open, jobs are running but logs can't be found

This probably means that the logs directory cuebot service is writing to (`$NFS_CONTAINER_PATH/logs`) isn't mounted at the same path on the machine runnung the cuegui app. Double check that directory is the same.