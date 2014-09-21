#-------------------------------------------------
#
# Project created by QtCreator 2012-07-13T10:32:04
#
#-------------------------------------------------

QT       += core gui opengl
qtHaveModule(printsupport): QT += printsupport

TARGET = slidewalk
TEMPLATE = app


INCLUDEPATH += /usr/local/include/openslide
LIBS += -L/usr/local/lib -lopenslide


SOURCES += main.cpp\
        mainbox.cpp \
    view.cpp \
    zoomgraphicsview.cpp

HEADERS  += mainbox.hpp \
    view.hpp \
    zoomgraphicsview.hpp

FORMS    += mainbox.ui

OTHER_FILES += \
    CMakeLists.txt
