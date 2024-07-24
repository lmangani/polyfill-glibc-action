# polyfill-glibc-action

Use `polyfill-glibc` ELF patcher in your Github Actions

> How often have you compiled a C/C++ program on a recent Linux system, tried to run that compiled program on an older Linux system, and then hit a GLIBC version error?
```
new-system$ gcc my-program.c -o my-program
old-system$ ./my-program
./my-program: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.28' not found (required by ./my-program)
```

## Inputs

### `target`

Binary ELF to be patched with polyfill-glibc

### `glibc`

Version of glibc to patch against. Default: `2.17`

## Example usage

### Install Only

    - name: Patch glibc for backwards compatibility
      uses: lmangani/polyfill-glibc-action:main
      id: polyfill
      with:
        install: "true"
    - run: polyfill-glibc --target-glibc=2.17 /path/to/binary

### Execute & Replace file
    - name: Patch glibc for backwards compatibility
      uses: lmangani/polyfill-glibc-action:main
      id: polyfill
      with:
        glibc: "2.28"
        target: "/path/to/binary"
