#! /bin/bash
# shellcheck source=/dev/null

set -Eeuo pipefail

export PATH="/usr/bin:${PATH}"  # To find `id`
source /etc/profile  # Makes python and other executables findable

if [[ -n ${INPUT_OUTDIR} ]]; then
    python -m build --outdir "${INPUT_OUTDIR}"
fi

if [[ ${INPUT_CHECK,,} != "no" ]] ; then
    python -m twine check "${INPUT_OUTDIR%%/}"/*
fi

if [[ ${INPUT_REGISTER,,} != "no" ]] ; then
    TWINE_USERNAME="$INPUT_USER" \
    TWINE_PASSWORD="$INPUT_PASSWORD" \
    TWINE_REPOSITORY_URL="$INPUT_URL" \
        python -m twine register "${INPUT_OUTDIR%%/}"/*.tar.gz
fi

EXTRA_ARGS=
if [[ ${INPUT_VERBOSE,,} != "no" ]] ; then
    EXTRA_ARGS="--verbose"
fi

TWINE_USERNAME="$INPUT_USER" \
TWINE_PASSWORD="$INPUT_PASSWORD" \
TWINE_REPOSITORY_URL="$INPUT_URL" \
  python -m twine upload "${EXTRA_ARGS}" "${INPUT_OUTDIR}"/*
