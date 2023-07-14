FROM python:2.7-slim

LABEL \
  maintainer="César Román <cesar@coatl.dev>" \
  repository="https://github.com/coatl-dev/action-pypi-upload" \
  homepage="https://github.com/marketplace/actions/python2-pypi-upload" \
  vendor="coatl.dev"

ENV PIP_NO_CACHE_DIR 1
ENV PIP_NO_PYTHON_VERSION_WARNING 1

COPY requirements /tmp/requirements/
RUN set -eux; \
    python -m pip install --requirement /tmp/requirements/base.txt; \
    python -m pip install --requirement /tmp/requirements/packaging.txt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
