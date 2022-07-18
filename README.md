# Docker image with [phpqa](https://github.com/nuwber/phpqa-docker/pkgs/container/phpqa-docker)

https://github.com/nuwber/phpqa-docker/pkgs/container/phpqa-docker

## Usage
### GitHub Actions

```code-check.yml
name: Code check

on: [push]

jobs:
  code-check:
    container: ghcr.io/nuwber/phpqa-docker:php8.1
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: phpqa
        run: phpqa --analyzedDirs src --output cli --tools phpcs.PSR12:0,phpmd,phpcpd:0,phpmetrics:0,phploc,pdepend
```

### Gitlab CI

```.gitlab-ci.yml
image: ghcr.io/nuwber/phpqa-docker:php8.1

stages:
  - testing

testing:code_check:
  stage: testing
  script:
    - phpqa --analyzedDirs src --output cli --tools phpcs.PSR12:0,phpmd,phpcpd:0,phpmetrics:0,phploc,pdepend
  tags:
    - testing
```
