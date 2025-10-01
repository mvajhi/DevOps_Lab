#!/bin/bash
PGPASSWORD=${POSTGRES_PASSWORD} psql --username=${POSTGRES_USER} -f /opt/psql-test/postgres_backup_*
PGPASSWORD=${POSTGRES_PASSWORD} psql --username=${POSTGRES_USER} -t -c "SELECT COUNT(*) FROM votes" | sed -n '1 p' | awk '{print $1}' | tee /opt/psql-test/restore.log