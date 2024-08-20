# NGINX Rev Proxy for Notion Page

---

## Commands

```bash
# Build the image
docker build -t kysa24-docs-proxy --platform linux/amd64 -f storage/nginx/build/Dockerfile .

# tag the image
docker tag kysa24-docs-proxy gcr.io/<pj_name>/kysa24-docs-proxy

# (optional) authenticate cloud registry
gcloud auth configure-docker

# push the image
docker push gcr.io/<pj_name>/kysa24-docs-proxy

# update service
gcloud run deploy kysa24-docs-proxy --image gcr.io/<pj_name>/kysa24-docs-proxy --port 8081 --allow-unauthenticated
```
