#!/bin/sh
# Publishes every *.yaml file found under /configs and /extra into Nacos.
# The file name is used as the dataId (e.g. mall-admin-prod.yaml). The tenant is set to
# "public" explicitly because Nacos clients 2.5 query that namespace id literally.
set -e
NACOS=${NACOS_ADDR:-nacos-registry:8848}
for f in /configs/*/*.yaml /extra/*.yaml; do
  [ -f "$f" ] || continue
  id=$(basename "$f")
  echo "Publishing $id"
  until curl -sf -X POST "http://$NACOS/nacos/v1/cs/configs" \
      --data-urlencode "dataId=$id" \
      --data-urlencode "group=DEFAULT_GROUP" \
      --data-urlencode "tenant=public" \
      --data-urlencode "type=yaml" \
      --data-urlencode "content@$f" | grep -q true; do
    echo "  retrying $id"; sleep 3
  done
done
echo "All configs published"
