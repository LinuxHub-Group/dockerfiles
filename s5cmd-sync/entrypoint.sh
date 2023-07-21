#!/bin/sh

SYNCOPTIONS=""
OPTIONS=""

if [ -n "$S5CMD_ENDPOINT" ]; then
    OPTIONS="${OPTIONS} --endpoint-url $S5CMD_ENDPOINT"
fi

if [ -n "$S5CMD_SSE" ]; then
    SYNCOPTIONS="${SYNCOPTIONS} --sse $S5CMD_SSE"
fi

if [ -n "$S5CMD_SSE_KMS_KEY_ID" ]; then
    SYNCOPTIONS="${SYNCOPTIONS} --sse-kms-key-id $S5CMD_SSE_KMS_KEY_ID"
fi

if [ -n "$S5CMD_EXPIRES" ]; then
    SYNCOPTIONS="${SYNCOPTIONS} --expires $S5CMD_EXPIRES"
fi

if [ -n "$S5CMD_DELETE" ]; then
    SYNCOPTIONS="${SYNCOPTIONS} --delete"
fi

SYNCOPTIONS="${SYNCOPTIONS} $S5CMD_EXCLUDES"

if [ -z "$CRON_SCHEDULE" ]; then
    CRON_SCHEDULE="* * * * *"
fi

echo "$CRON_SCHEDULE cd /aws/ && /s5cmd ${OPTIONS} sync ${SYNCOPTIONS} . ${S5CMD_DESTINATION}" >/etc/cron/crontab

crontab /etc/cron/crontab
crond -f
