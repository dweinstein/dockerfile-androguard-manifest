# SYNOPSIS

dump the manifest with androguard


# USAGE

```shell
 # XML output to stdout
docker run dweinstein/androguard-manifest -i http://host:port/app.apk

# OR input file inside container already: just supply path (using volume container)
docker run -v /path/to/apps/:/path/in/container dweinstein/androguard-manifest -i /path/in/container/to/apk

# OR POST XML result
docker run dweinstein/androguard-manifest -i http://host:port/path/to/file.apk -o http://host:port/save/report

# OR from stdin and output to stdout
docker run -i dweinstein/androguard-manifest -i - < ~/android/apks/foo.apk

```

# DEVELOPMENT
```shell
$ docker build -t androguard-manifest .
```

