#! /bin/bash
# shellcheck source=/dev/null

set -Eeuo pipefail

export PATH="/usr/bin:${PATH}"  # To find `id`
source /etc/profile  # Makes python and other executables findable

python -m build

if [[ ${INPUT_CHECK,,} != "no" ]] ; then
    python -m twine check dist/*
fi

if [[ ${INPUT_REGISTER,,} != "no" ]] ; then
    TWINE_USERNAME="$INPUT_USERNAME" \
    TWINE_PASSWORD="$INPUT_PASSWORD" \
    TWINE_REPOSITORY_URL="$INPUT_URL" \
        python -m twine register dist/*.tar.gz
fi

if [[ ${INPUT_UPLOAD,,} != "no" ]] ; then
    TWINE_USERNAME="$INPUT_USERNAME" \
    TWINE_PASSWORD="$INPUT_PASSWORD" \
    TWINE_REPOSITORY_URL="$INPUT_URL" \
    python -m twine upload --verbose dist/*
fi
