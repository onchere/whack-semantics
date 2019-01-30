**whack-semantics**
===================
This repository contains executable formal semantics for the
[Whack Programming Language](https://github.com/onchere/whack)
which are being written using the [K Framework](https://k-framework.org) tools (v3.4).
This is going to be a laborious endeavour, and no claim is made as to the
completeness of the contained semantics.

Objectives
==========
- Have a formal specification of the semantics of Whack.
- To obtain a program verifier and other language tools for Whack;
which are **guaranteed** to be correct-by-construction.

Progress
========
Work in Progress (untyped semantics go first).
*We assume we're using `int`s for now.*
Also devising a comprehensive memory model, likely to based on the
x86-TSO relaxed memory model; a static type system should follow thereupon.

License
=======
Apache 2.0 License.
