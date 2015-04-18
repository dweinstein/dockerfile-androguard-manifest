#!/usr/bin/env sh
set -e

APK_URL="$1"
CALLBACK_URL="$2"
GET_TIMEOUT=20
POST_TIMEOUT=5
CONTENT_TYPE="text/xml"
TOOL="python ./androguard_manifest.py"

TMP_DIR=$([[ -d "/dev/shm" ]] && echo "/dev/shm/" || echo "/tmp/")
INPUT_PATH="${TMP_DIR}/android_app.apk"

( ( [[ -z "${APK_URL}" ]] && cat > "${INPUT_PATH}" ) || \
  ( [[ -e  "${APK_URL}" ]] && cat "${APK_URL}" > "${INPUT_PATH}" ) || \
  curl -m ${GET_TIMEOUT} -s "${APK_URL}" -o "${INPUT_PATH}" )

${TOOL} ${INPUT_PATH} | \
  ( [[ -z "${CALLBACK_URL}" ]] && cat || \
  curl -m ${POST_TIMEOUT} -s -XPOST "${CALLBACK_URL}" -H "Content-Type: ${CONTENT_TYPE}" --data-binary @- )

