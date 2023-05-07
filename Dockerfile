FROM python:2.7-slim

LABEL \
  maintainer="César Román <cesar@coatl.dev>" \
  repository="https://github.com/coatl-dev/pypi-upload" \
  homepage="https://github.com/marketplace/actions/python2-pypi-build-upload" \
  vendor="coatl.dev"

COPY requirements.txt /tmp/
RUN \
    python -m pip install --no-cache-dir \
      --no-python-version-warning pip==20.3.4 && \
    python -m pip install --no-cache-dir \
      --no-python-version-warning --requirement /tmp/requirements.txt
COPY . /tmp/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
