# SYNOPSIS

dump the manifest with androguard


# USAGE

```shell
 # XML output to stdout
docker run dweinstein/androguard-manifest http://host:port/app.apk

# OR input file inside container already: just supply path (using volume container)
docker run -v /path/to/apps/:/path/in/container dweinstein/androguard-manifest /path/in/container/to/apk

# OR POST XML result
docker run dweinstein/androguard-manifest http://host:port/path/to/file.apk http://host:port/save/report

# OR from stdin and output to stdout
docker run -i dweinstein/androguard-manifest < ~/android/apks/foo.apk

```

# DEVELOPMENT
```shell
$ docker build -t androguard-manifest .
```

