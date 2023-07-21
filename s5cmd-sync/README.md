# s5cmd-sync

sync your files to s3 storage using s5cmd

```shell
docker run -it --rm \
  -e AWS_ACCESS_KEY_ID=4e9a01106 \
  -e AWS_SECRET_ACCESS_KEY=5de0703e54e9 \
  -e S5CMD_ENDPOINT=https://bff48b41b.r2.cloudflarestorage.com \
  -e S5CMD_DESTINATION=s3://my-bucket/tttt/ \
  -e S5CMD_DELETE=true \
  -v /home/demo/test:/aws \
  ghcr.io/linuxhub-group/s5cmd-sync/s5cmd-sync 
```
