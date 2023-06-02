# pypi-upload

GitHub action for building and publishing your Python 2 distribution files to
PyPI or any other repository using `build` and `twine`.

## Usage

To use this action, add the following step to your workflow file (e.g.
`.github/workflows/publish.yaml`).

```yml
name: publish

on:
  release:
    types:
      - published

jobs:
  pypi-publish:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: python2-pypi-upload
        uses: coatl-dev/action-pypi-upload@v1.0.0
        with:
          password: ${{ secrets.PYPI_API_TOKEN_IGNITION_API_PKG }}
```

## Uploading to TestPyPI

```yml
- name: Publish package to TestPyPI
  uses: coatl-dev/action-pypi-upload@v1.0.0
  with:
    username: ${{ secrets.TEST_PYPI_USER }}
    password: ${{ secrets.TEST_PYPI_API_TOKEN }}
    url: "https://test.pypi.org/legacy/"
```

## Disabling metadata verification

It is recommended that you run `twine check` before upload. You can also disable
it with:

```yml
   with:
     check: no
```

## Full syntax

The full syntax for this action is:

```yml
  uses: coatl-dev/action-pypi-upload@v1.0.0
  with:
    username: "__token__" # string. Defaults to '__token__'. Optional.
    password: # string. Required. It can be a password or token. It is recommended to keep your password as secrets.
    url: "https://upload.pypi.org/legacy/" # string. Defaults to 'https://upload.pypi.org/legacy/'. Optional.
    check: "yes" # string. Defaults to 'yes'. Options: 'yes', 'no'. Optional.
```
