using BinaryBuilder

# zlib version
version = v"1.2.11"

# Collection of sources required to build zlib
sources = [
    "https://zlib.net/zlib-$(version).tar.gz" =>
    "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
]

# Bash recipe for building across all platforms
script = raw"""
cd $WORKSPACE/srcdir
cd zlib-1.2.11/

# On windows platforms, our ./configure and make invocations differ a bit
if [[ ${target} == *-w64-mingw* ]]; then
    EXTRA_CONFIGURE_FLAGS="--sharedlibdir=${prefix}/bin"
    EXTRA_MAKE_FLAGS="SHAREDLIB=libz.dll SHAREDLIBM=libz-1.dll SHAREDLIBV=libz-1.2.11.dll LDSHAREDLIBC= "
fi

./configure ${EXTRA_CONFIGURE_FLAGS} --prefix=${prefix}
make install ${EXTRA_MAKE_FLAGS} -j${nproc}

# See https://github.com/JuliaDiffEq/SundialsBuilder/blob/a292690199bb5b99cd7ec3f952a58f621c9b3f97/build_tarballs.jl#L62-L68.
# On windows, move all `.dll` files to `bin`. We don't want to follow symlinks
# because non-administrative users cannot create symlinks on Windows, so we
# use `cp -L` followed by `rm` instead of just `mv`.
if [[ ${target} == *-mingw32 ]]; then
    cp -L $WORKSPACE/destdir/lib/*.dll $WORKSPACE/destdir/bin
    rm -f $WORKSPACE/destdir/lib/*.dll
fi
"""

# Build for ALL THE PLATFORMS!
platforms = supported_platforms()

# The products that we will ensure are always built
products = prefix -> [
    LibraryProduct(prefix, "libz", :libz),
]

# Dependencies that must be installed before this package can be built
dependencies = [
]

build_tarballs(ARGS, "Zlib", version, sources, script, platforms, products, dependencies)
