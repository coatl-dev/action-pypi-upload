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
  main:
    uses: coatl-dev/action-pypi-upload@v0.1.3
    with:
      password: ${{ secrets.PYPI_API_TOKEN }}
```

## Uploading to TestPyPI

```yml
- name: Publish package to TestPyPI
  uses: coatl-dev/action-pypi-upload@v0.1.3
  with:
    user: ${{ secrets.TEST_PYPI_USER }}
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

## For debugging

Sometimes, `twine upload` can fail and to debug use the verbose setting as
follows:

```yml
   with:
     verbose: yes
```

## Full syntax

The full syntax for this action is:

```yml
  uses: coatl-dev/action-pypi-upload@v0.1.3
  with:
    user: "__token__" # string. Optional. Default '__token__'.
    password: # string. Required. It is recommended to keep your password as secrets.
    url: "https://upload.pypi.org/legacy/" # string. Optional. Default 'https://upload.pypi.org/legacy/'.
    outdir: "dist" # string. Optional. Default 'dist'.
    check: "yes" # string. Optional. Default 'yes'. Options: 'yes', 'no'.
```
