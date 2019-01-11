# toolchain-musl

This toolchain is built using principles from Linux From Scratch.
It is meant to provide a clean toolchain for building musl based Linux distributions.

The build starts by first creating a cross compiler and cross linker targeted for `x86_64` architecture using [`musl`](https://www.musl-libc.org/).
Next, a native toolchain is built.
Finally `musl` is built.

## Resources

- https://gcc.gnu.org/onlinedocs/gccint/Configure-Terms.html
- https://wiki.osdev.org/Target_Triplet
