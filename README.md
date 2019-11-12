# ghc-static-flags-test

Test project for my effort to teach GHC/Cabal to remember `pkg-config --libs --static` flags.

## Usage

Build GHC from my branch; as of writing that is [`static-flags-wip`](https://gitlab.haskell.org/nh2/ghc/tree/static-flags-wip) at [this commit](https://gitlab.haskell.org/nh2/ghc/commit/56a68ee4a436440f6f7af917baf001b239e2d3ab).

Update `./test.sh` for the path of the built GHC, then run it.

