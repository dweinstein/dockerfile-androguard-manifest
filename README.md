# SYNOPSIS

dump the manifest with androguard


# USAGE

## NORMAL

```shell
./runner.sh < /path/to/apk # [optional http(s):// post]

./runner.sh /path/to/apk # [optional http(s):// post]

```
## DOCKER

```shell
docker build -t androguard-manifest .

 # XML output to stdout
docker run androguard-manifest http://host:port/app.apk

# OR input file inside container already: just supply path (using volume container)
docker run -v /path/to/apps/:/path/in/container androguard-manifest /path/in/container/to/apk

# OR POST XML result
docker run androguard-manifest http://host:port/path/to/file.apk http://host:port/save/report

# OR from stdin and output to stdout
docker run -i androguard-manifest < ~/android/apks/foo.apk

```
