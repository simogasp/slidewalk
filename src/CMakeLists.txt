#########################################################
# MAIN PROJECT
#########################################################

qt5_wrap_ui(UI_HEADERS mainbox.ui)

# Tell CMake to create the  executable
add_executable(slidewalk main.cpp mainbox.cpp view.cpp zoomgraphicsview.cpp ${UI_HEADERS})

#Link the executable to the Qt 5 widgets library.
target_link_libraries(slidewalk Qt5::Widgets Qt5::OpenGL Qt5::PrintSupport ${OpenSlide_LIBS} )
