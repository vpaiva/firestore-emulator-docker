ARG GCLOUD_SDK_VERSION=527.0.0-alpine

FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
LABEL maintainer="Vinício Paiva <vpaiva@gmail.com>"

# Install Java 21 JRE (required for Firestore emulator).
RUN apk add --update --no-cache openjdk21-jre

# Install Firestore Emulator.
RUN gcloud components install cloud-firestore-emulator --quiet

COPY entrypoint.sh .

ENV PORT 8080
EXPOSE "$PORT"

ENV FIRESTORE_PROJECT_ID "dummy-firestore-id"

ENTRYPOINT ["./entrypoint.sh"]
