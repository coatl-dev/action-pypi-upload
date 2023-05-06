FROM python:2.7-slim

LABEL "maintainer" "César Román <cesar@coatl.dev"
LABEL "repository" "https://github.com/coatl-dev/pypi-upload"
LABEL "homepage" "https://github.com/coatl-dev/pypi-upload"

RUN \
    python -m pip install --no-cache-dir --no-python-version-warning --upgrade pip build twine

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
