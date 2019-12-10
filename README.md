# tclscan-docker
tclscan docker image

`tclscan` is a tool that scans Tcl code for command injection flaws. For example, it can be used to assess vulnerabilities in F5 load balancer rules (implemented in Tcl). Building `tclscan` from source has proven somewhat challenging because of its dependencies (Tcl, Rust, LLVM), version mismatches, etc. `tclscan-docker` helps with that by providing a standard Dockerfile and Docker image

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
