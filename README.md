# cybersource-ruby

This repository has been created by the pattern automation workflow service (PAWS) via a devportal 'paved road'. In this case, a Java Library.
The source code example should provide you with a starting point for creating a Java Library.

Please choose Java package names carefully, and consult with other developers as to the library API
and its choice of dependencies.

All logging should be done via `slf4-api` only:
the application/service will choose the actual logging implementation,
so use log4j2 or logback-classic in `<scope>test</scope>` only.

## Build

To build and run the unit tests:

```bash
mvn clean install
```

The above assumes have a suitable "~/.m2/settings.xml" — you may copy the one in
this repo if not.
