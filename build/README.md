# Building nginx .deb package from source

This builds nginx from source and creates a .deb package you can use to
can install on the main docker machine.

You have to take the following steps:

1. Build the .deb package in a docker container
```sh
$ ./build.sh
```

2. Extract the .deb package from the docker container
```sh
$ ./extractdeb.sh
```

3. You find the resulting .deb package in this folder.
