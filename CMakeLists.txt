# for Mac with qt5 installed with homebrew use
# ccmake .. -DCMAKE_PREFIX_PATH=/usr/local/Cellar/qt5/5.3.0/lib/cmake -DOpenCV_DIR=~/dev/code/lib/opencv/buildclang/install/share/OpenCV/

cmake_minimum_required(VERSION 2.8.3)

project(sidewalk)

# set the path where we can find the findXXX.cmake
SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/.cmake)


#########################################################
# FIND OPENSLIDE
#########################################################
find_package(OpenSlide REQUIRED)
include_directories(${OpenSlide_INCLUDE_DIRS})
link_directories(${OpenSlide_LIB_DIRS})
# message("OpenSlide_LIB_DIRS = ${OpenSlide_LIB_DIRS}")

if(NOT OPENSLIDE_FOUND )
    message(ERROR " OpenSlide not found!")
    message(WARNING "Consider setting the OpenSlide_DIR environment variable if you installed the library in a non-standard prefix")
else()
    message( "-- Found OpenSlide " )
endif(NOT OPENSLIDE_FOUND)


# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

#########################################################
# FIND QT5
#########################################################

# Find the QtWidgets library
#find_package(Qt5)
find_package(Qt5Widgets)
find_package(Qt5OpenGL)
find_package(Qt5PrintSupport QUIET)

# Add the include directories for the Qt 5 Widgets module to
# the compile lines.
include_directories(${Qt5Widgets_INCLUDE_DIRS})
include_directories(${Qt5OpenGL_INCLUDE_DIRS})
include_directories(${Qt5PrintSupport_INCLUDE_DIRS})

# Use the compile definitions defined in the Qt 5 Widgets module
add_definitions(${Qt5Widgets_DEFINITIONS})
add_definitions(${Qt5OpenGL_DEFINITIONS})
add_definitions(${Qt5PrintSupport_DEFINITIONS})

set(CMAKE_AUTOMOC ON)

# Add compiler flags for building executables (-fPIE)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS} ${Qt5OpenGL_EXECUTABLE_COMPILE_FLAGS} ${Qt5PrintSupport_EXECUTABLE_COMPILE_FLAGS}")

#########################################################
# MAIN PROJECT
#########################################################

qt5_wrap_ui(UI_HEADERS mainbox.ui)

# Tell CMake to create the  executable
add_executable(slidewalk main.cpp mainbox.cpp view.cpp zoomgraphicsview.cpp ${UI_HEADERS})

#Link the executable to the Qt 5 widgets library.
target_link_libraries(slidewalk Qt5::Widgets Qt5::OpenGL Qt5::PrintSupport ${OpenSlide_LIBS} )
