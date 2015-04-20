#!/usr/bin/env sh
set -e

APK_URL="$1"
CALLBACK_URL="$2"

[ -z "${GET_TIMEOUT}" ] && GET_TIMEOUT=20
[ -z "${POST_TIMEOUT}" ] && POST_TIMEOUT=5
[ -z "${CONTENT_TYPE}" ] && CONTENT_TYPE="text/xml"
[ -z "${PYTHON}" ] && PYTHON=python2
[ -z "${TOOL}" ] && TOOL="${PYTHON} ./androguard_manifest.py"
[ -z "${CURL}" ] && CURL=curl

# use a ramfs if possible for storing the app
[ -z "${TMPDIR}" ] && TMPDIR=/dev/shm

INPUT_PATH="${TMPDIR}/android_app.apk"
case "${APK_URL}" in
-|'')
  cat > "${INPUT_PATH}" || exit 1
  ;;
http*)
  ${CURL} -m ${GET_TIMEOUT} -so "${INPUT_PATH}" "${APK_URL}" || exit 1
  ;;
*)
  [ -f "${APK_URL}" ] && cp "${APK_URL}" "${INPUT_PATH}" || exit 1
  ;;
esac

if [ -n "${CALLBACK_URL}" ]; then
  exec ${TOOL} "${INPUT_PATH}" | \
      ${CURL} -m ${POST_TIMEOUT} -s \
      -XPOST "${CALLBACK_URL}" \
      -H "Content-Type: ${CONTENT_TYPE}" \
      --data-binary @-
else
  exec ${TOOL} "${INPUT_PATH}"
fi

