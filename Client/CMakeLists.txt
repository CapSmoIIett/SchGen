cmake_minimum_required(VERSION 3.16)

project(SchGen VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

#qt_standard_project_setup()

qt_add_executable(appSchGen
    main.cpp
    qml.qrc
    images.qrc

    ../datastructures.h

    appcore.h
    appcore.cpp
    calendarctrl.h
    calendarctrl.cpp
    daymodel.h
    daymodel.cpp
    weekmodel.h
    weekmodel.cpp
    monthmodel.h
    monthmodel.cpp
    grouplistmodel.h
    grouplistmodel.cpp

)

qt_add_qml_module(appSchGen
    URI SchGen
    VERSION 1.0
    QML_FILES qml/main.qml
)

set_target_properties(appSchGen PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appSchGen
    PRIVATE Qt6::Quick
)


install(TARGETS appSchGen
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

