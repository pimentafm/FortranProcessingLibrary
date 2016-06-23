Build System
************
Elemental's build system relies on `CMake <http://www.cmake.org>`__ 
in order to manage a large number of configuration options in a 
platform-independent manner; it can be easily configured to build on Linux and 
Unix environments (including Darwin), as well as via Cygwin in a Windows 
environment (Visual Studio's is expected to begin supporting ``constexpr``, 
which is heavily used by Elemental, with the official VS 2015 release in 
July 2015). A relatively recent C++11 compiler (e.g., gcc >= 4.7) is 
required in all cases.

Elemental's main external dependencies are

1. `CMake <http://www.cmake.org/>`__ ,
2. `MPI <http://en.wikipedia.org/wiki/Message_Passing_Interface>`__ ,
3. `BLAS <http://netlib.org/blas>`__ ,
4. `LAPACK <http://netlib.org/lapack>`__, 
5. `METIS <http://glaros.dtc.umn.edu/gkhome/metis/metis/overview>`__, and
6. `PMRRR <http://code.google.com/p/pmrrr>`__,

and the dependencies which can **not** currently be automatically handled by 
Elemental's build system are

1. CMake, and
2. MPI.

Handling mandatory external dependencies
========================================

Installing CMake
----------------
Elemental uses several relatively new CMake modules, so it is important to 
ensure that CMake version 2.8.12 or later is available. Thankfully, the 
`installation process <http://www.cmake.org/cmake/help/install.html>`_
is extremely straightforward: either download a platform-specific binary from
the `downloads page <http://www.cmake.org/cmake/resources/software.html>`_,
or instead grab the most recent stable tarball and have CMake bootstrap itself.
In the simplest case, the bootstrap process is as simple as running the 
following commands::

    ./bootstrap
    make
    sudo make install

Note that recent versions of `Ubuntu <http://www.ubuntu.com/>`__ (e.g., version 13.10) have sufficiently up-to-date
versions of CMake, and so the following command is sufficient for installation::

    sudo apt-get install cmake

If you do install from source, there are two important issues to consider

1. By default, ``make install`` attempts a system-wide installation 
   (e.g., into ``/usr/bin``) and will likely require administrative privileges.
   A different installation folder may be specified with the ``--prefix`` 
   option to the ``bootstrap`` script, e.g.,::

    ./bootstrap --prefix=/home/your_username
    make
    make install

   Afterwards, it is a good idea to make sure that the environment variable 
   ``PATH`` includes the ``bin`` subdirectory of the installation folder, e.g.,
   ``/home/your_username/bin``.

2. Some highly optimizing compilers will not correctly build CMake, but the GNU
   compilers nearly always work. You can specify which compilers to use by
   setting the environment variables ``CC`` and ``CXX`` to the full paths to 
   your preferred C and C++ compilers before running the ``bootstrap`` script.

Basic usage
^^^^^^^^^^^
Though many configuration utilities, like 
`autoconf <http://www.gnu.org/software/autoconf/>`_, are designed such that
the user need only invoke ``./configure && make && sudo make install`` from the
top-level source directory, CMake targets *out-of-source* builds, which is 
to say that the build process occurs away from the source code. The 
out-of-source build approach is ideal for projects that offer several 
different build modes, as each version of the project can be built in a 
separate folder.

A common approach is to create a folder named ``build`` in the top-level of 
the source directory and to invoke CMake from within it::

    mkdir build
    cd build
    cmake ..

The last line calls the command line version of CMake, ``cmake``,
and tells it that it should look in the parent directory for the configuration
instructions, which should be in a file named ``CMakeLists.txt``. Users that 
would prefer a graphical interface from the terminal (through ``curses``)
should instead use ``ccmake`` (on Unix platforms) or ``CMakeSetup`` 
(on Windows platforms). In addition, a GUI version is available through 
``cmake-gui``. 

Though running ``make clean`` will remove all files generated from running 
``make``, it will not remove configuration files. Thus, the best approach for
completely cleaning a build is to remove the entire build folder. On \*nix 
machines, this is most easily accomplished with::

    cd .. 
    rm -rf build/

This is perhaps a safer habit than simply running ``rm -rf *`` since, 
if accidentally run from the wrong directory, deleting ``build/`` would be 
unlikely to have any effect.

Soft dependencies
=================
As was already mentioned, Elemental has several external dependencies which
can be optionally be handled by the build process, and one 
(`PMRRR <http://code.google.com/p/pmrrr>`__), which is always built by 
Elemental. For the optionally-specified dependencies 
(i.e., BLAS, LAPACK, METIS, ParMETIS, and ScaLAPACK), if custom implementations
were not specified during the CMake configuration phase, then appropriate 
libraries will be automatically downloaded/built/installed via CMake's 
`ExternalProject <http://www.cmake.org/cmake/help/v3.0/module/ExternalProject.html>`__ functionality. In particular, Elemental can automatically fulfill 
dependencies using:

1. `OpenBLAS <http://www.openblas.net/>`__ or `BLIS <https://code.google.com/p/blis>`__ (to provide BLAS+LAPACK)
2. `METIS <http://glaros.dtc.umn.edu/gkhome/metis/metis/overview>`__ and/or `ParMETIS <http://glaros.dtc.umn.edu/gkhome/metis/parmetis/overview>`__ (for computing a vertex separator of a graph), and
3. `ScaLAPACK <http://netlib.org/scalapack>`__ (for implementations of distributed Hessenberg QR algorithms).

Furthermore, there are several further (optional) external dependencies:

1. `libFLAME <http://www.cs.utexas.edu/users/flame/>`_ is recommended 
   for faster SVD's due to its high-performance bidiagonal QR algorithm 
   implementation, 
2. `libquadmath <https://gcc.gnu.org/onlinedocs/libquadmath/>`_ for 
   quad-precision support (and more robust sparse-direct solvers),
3. `Qt5 <http://qt-project.org>`_ for C++11 matrix visualization,
4. `matplotlib <http://matplotlib.org/>`_ for Python matrix visualization,
5. `NetworkX <https://networkx.github.io/>`_ for Python graph visualization, and
6. `NumPy <http://www.numpy.org/>`_ for supporting the Python interface in 
   general.

Support is not required for any of these libraries, but each is helpful for 
particular components of Elemental's functionality.

Elemental as a CMake subproject
===============================

.. note::

   These instructions are somewhat out of date and so an email to 
   `users@libelemental.org <mailto:users@libelemental.org>`_ might be 
   more appropriate for now in order to help with using Elemental as a
   subproject of another CMake build system.
