# SYNOPSIS

dump the manifest with androguard


# USAGE

```shell
docker build -t androguard-manifest .

 # XML output to stdout
docker run androguard-manifest http://host:port/path/to/file.apk

# OR POST XML result
docker run androguard-manifest http://host:port/path/to/file.apk http://l

# OR from stdin and output to stdout
docker run -i androguard-manifest < ~/android/apks/foo.apk

```
