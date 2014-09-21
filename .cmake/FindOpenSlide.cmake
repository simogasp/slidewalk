# - Try to find OpenSlide
# OpenSlide_DIR is a variable that can be set with the install path of the libopenslide
# e.g.
# OpenSlide_DIR=/usr/local/
# and then it will look for /usr/local/include and /usr/local/lib respectively
#
# Once done this will define
# OPENSLIDE_FOUND
# OpenSlide_INCLUDE_DIRS
# OpenSlide_LIBS
# OpenSlide_LIB_DIRS

# Simone Gasparini

# message("CMAKE_INCLUDE_PATH = ${CMAKE_INCLUDE_PATH}")

if (DEFINED OpenSlide_DIR)
	message(STATUS "OpenSlide_DIR = ${OpenSlide_DIR}")
else()
	message(STATUS "-- OpenSlide_DIR not provided")
endif()


FIND_PATH(OpenSlide_INCLUDE_PATH 
	NAMES openslide.h
	HINTS
	${OpenSlide_DIR}/include/openslide
	$ENV{OpenSlide_HOME}/include/openslide
	PATHS
	${OpenSlide_DIR}/include/openslide
	$ENV{OpenSlide_HOME}/include/openslide
	/usr/include
	/usr/local/include
	/sw/include
	/opt/local/include		
	/usr/include/openslide
	/usr/local/include/openslide
	/sw/include/openslide
	/opt/local/include/openslide
	DOC "The directory where openslide.h resides")

# message("OpenSlide_INCLUDE_PATH = ${OpenSlide_INCLUDE_PATH}")

FIND_LIBRARY(OpenSlide_LIBRARY
	NAMES openslide libopenslide
	HINTS
	${OpenSlide_DIR}/lib
	PATHS
	${OpenSlide_DIR}/lib
	$ENV{OpenSlide_HOME}/lib
	/usr/lib
	/usr/local/lib
	/sw/lib
	/opt/local/lib
	DOC "The OpenSlide library")

# message("OpenSlide_LIBRARY = ${OpenSlide_LIBRARY}")



#message("OpenSlide_LIBRARY = ${OpenSlide_LIBRARY}")

set(OpenSlide_LIBS ${OpenSlide_LIBRARY} )
set(OpenSlide_INCLUDE_DIRS ${OpenSlide_INCLUDE_PATH} )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set OpenSlide_FOUND to TRUE
# if all listed variables are TRUE
if ("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION}" VERSION_GREATER "2.8.10")
	find_package_handle_standard_args( OpenSlide  FOUND_VAR OPENSLIDE_FOUND REQUIRED_VARS OpenSlide_LIBRARY OpenSlide_INCLUDE_PATH )
else()
	find_package_handle_standard_args( OpenSlide REQUIRED_VARS OpenSlide_LIBRARY OpenSlide_INCLUDE_PATH )
endif()

if (OPENSLIDE_FOUND)
	get_filename_component(OpenSlide_LIB_DIRS "${OpenSlide_LIBS}" PATH)
endif()

mark_as_advanced(OpenSlide_LIBRARY)
 