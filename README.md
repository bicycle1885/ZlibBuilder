**NOTICE**: This repository has been moved to https://github.com/JuliaPackaging/Yggdrasil, and therefore is no longer actively maintained here. 

# ZlibBuilder

[![Build Status](https://travis-ci.org/bicycle1885/ZlibBuilder.svg?branch=master)](https://travis-ci.org/bicycle1885/ZlibBuilder)

This is an example repository showing how to construct a "builder" repository for a binary dependency.  Using a combination of [`BinaryBuilder.jl`](https://github.com/JuliaPackaging/BinaryBuilder.jl), [Travis](https://travis-ci.org), and [GitHub releases](https://docs.travis-ci.com/user/deployment/releases/), we are able to create a fully-automated, github-hosted binary building and serving infrastructure.

## License of Binary Assets

Binary assets at the release page are distributed under the following license (the Zlib License):

```
/* zlib.h -- interface of the 'zlib' general purpose compression library
  version 1.2.11, January 15th, 2017

  Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.

  Jean-loup Gailly        Mark Adler
  jloup@gzip.org          madler@alumni.caltech.edu

*/
```
