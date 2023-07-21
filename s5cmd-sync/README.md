# s5cmd-sync

sync your files to s3 storage using s5cmd

```shell
docker run -it --rm \
  -e AWS_ACCESS_KEY_ID=4e9a01106 \
  -e AWS_SECRET_ACCESS_KEY=5de0703e54e9 \
  -e S3_ENDPOINT_URL=https://bff48b41b.r2.cloudflarestorage.com \
  -e S5CMD_DESTINATION=s3://my-bucket/tttt/ \
  -e S5CMD_DELETE=true \
  -v /home/demo/test:/aws \
  ghcr.io/linuxhub-group/s5cmd-sync/s5cmd-sync 
```

## usage

mount your directory to be synchronized to `/aws`,and run the docker container `ghcr.io/linuxhub-group/s5cmd-sync/s5cmd-sync`.

### ENVIRONMENT

- `S3_ENDPOINT_URL` ,`required`: S3 API compatible service endpoint
- `AWS_ACCESS_KEY_ID` ,`required`: access key
- `AWS_SECRET_ACCESS_KEY` ,`required`: secret access key
- `S5CMD_DESTINATION` ,`required`: destination bucket, e.g. s3://my-bucket/tttt/

- `AWS_PROFILE` : AWS profile
- `AWS_REGION` : AWS region

- `CRON_SCHEDULE` : cron scheduler (unix-cron), default is every minute: "* * * * *"
- `S5CMD_SSE` : perform server side encryption of the data at its destination, e.g. aws:kms
- `S5CMD_SSE_KMS_KEY_ID` : customer master key (CMK) id for SSE-KMS encryption; leave it out if server-side generated key is desired
- `S5CMD_EXPIRES` : set expires for target (uses RFC3339 format): defines expires header for object, e.g. cp  --expires '2024-10-01T20:30:00Z'
- `S5CMD_DELETE` : delete objects in destination but not in source (default: false)
- `S5CMD_EXCLUDES` : exclude objects with given pattern  (accepts multiple inputs), e.g: "--exclude *.env --exclude abc"
