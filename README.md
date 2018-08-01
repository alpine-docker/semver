# alpine/semver

Docker image with [Semantic Versioning 2.0.0](https://semver.org/)

## Usage
```bash
$ docker run --rm alpine/semver server -c -i minor 1.0.2
1.1.0
    
```
## Example
```bash
$ docker run --rm marcelocorreia/semver semver -c -i minor 1.1.0
$ docker run --rm marcelocorreia/semver semver -c -i minor $(git describe --tags --abbrev=0)
```

# Full Example in Makefile

* [Makefile](./Makefile)

```
RELEASE_TYPE ?= patch

CURRENT_VERSION := $(shell git ls-remote --tags | awk '{ print $$2}'| sort -nr | head -n1|sed 's/refs\/tags\///g')

ifndef CURRENT_VERSION
  CURRENT_VERSION := 0.0.0
endif

NEXT_VERSION := $(shell docker run --rm alpine/semver semver -c -i $(RELEASE_TYPE) $(CURRENT_VERSION))

current-version:
	@echo $(CURRENT_VERSION)

next-version:
	@echo $(NEXT_VERSION)

release:
	git checkout master;
	git tag $(NEXT_VERSION)
	git push --tags
```
