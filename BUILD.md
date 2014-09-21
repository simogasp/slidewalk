Slidewalk
=========

[TOC]

----------------------
Building instructions
----------------------

The building has been tested successfully using `Qt 5.3` and `OpenSlide 3.4.0` on:
- Linux Mint 17 with `gcc 4.8.2`
- Mac OSX 10.9.4 with `clang 5.1 (clang-503.0.40) (based on LLVM 3.4svn)`
- Windows 7 with `msvc 18.0.30723.0`

## Required tools:

- git
- C/C++ compiler (gcc >= 4.6 or visual studio or clang)
- CMake >= 2.8.11

The main prerequisite for the application is OpenSlide and Qt5. 

On a recent Ubuntu-like distribution, you may want to try to run:
```shell
sudo apt-get install g++ git-all libqt5-dev libqt5-opengl-dev libopenslide-dev
```

On a OSX machine running ``Homebrew``, you may want to run:
```shell
brew install libopenslide qt5
```

On a Windows machine you have to install them manually (yes... it sucks!):
- QT5 from [here](http://qt-project.org/downloads), it should install by default in ``C:\Qt``
- OpenSlide from [here](http://openslide.org/download/), then unzip in a folder of your choice


## Building the sources

The standard procedure for CMake require to create a folder where to deploy all the building files (Makefiles or Solution files for Visual Studio). For example, from the root of the project you can create a directory `build`:

```shell
mkdir build
cd build
cmake .. 
make 
```

For Windows, you need to tell cmake the location of your libraries and where to find the Qt5 modules, so the `cmake` line becomes:

```shell
cmake .. -DOpenSlide_DIR=C:/your/path/to/openslide-win64-20140125 -DCMAKE_PREFIX_PATH=C:/Qt/5.3/msvc2013_64/lib/cmake
```

For Mac OSX, you also need to specify the location of the different cmake files for Qt5:
```shell
cmake .. -DCMAKE_PREFIX_PATH=/usr/local/Cellar/qt5/5.3.0/lib/cmake
```

More in general, use ``-DOpenSlide_DIR`` to point to the base path of the library if it is not installed in a system folder.

Use ``-DCMAKE_PREFIX_PATH`` to point to the Qt5 directory containing the cmake files for the different modules, usually this directory is called `cmake` (see the example above)

