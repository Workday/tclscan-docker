# tclscan-docker
tclscan docker image

See
* https://github.com/kugg/tclscan
* https://blog.f-secure.com/command-injection-in-f5-irules/

### Build
  ```
  docker build -t tclscan .
  ```

### Run
* Usage
```
docker run --rm -i tclscan
```

```
Invalid arguments.

Usage: tclscan check [--no-warn] ( - | <path> )
    tclscan parsestr ( - | <script-str> )
```

* Read file from pipe (stdin)
```
docker run --rm -i tclscan check - < poo.tcl
```
or
```
cat poo.tcl | docker run --rm -i tclscan check -
```

```
DANGER: Dangerous unquoted block at `[stats [HTTP::header {user-agent}]]` in `eval [stats [HTTP::header {user-agent}]]
`
```

* Read file from current directory (via docker volume mount)
```
docker run --rm -i -v `pwd`:/data tclscan check poo.tcl
```

```
DANGER: Dangerous unquoted block at `[stats [HTTP::header {user-agent}]]` in `eval [stats [HTTP::header {user-agent}]]
`
```
