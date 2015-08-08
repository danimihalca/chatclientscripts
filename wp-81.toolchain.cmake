#cmake build and install using msvc
# cmake --build . --target install <--config -- "/p:Platform=ARM">
#SET(CMAKE_GENERATOR "Visual Studio 12 2013 ARM" CACHE INTERNAL "" FORCE) #run cmake twice when set only here, lazy generator set
#SET(CMAKE_SHARED_LINKER_FLAGS "/machine:ARM") #not needed when setting the generator as argument

SET(CMAKE_SYSTEM_NAME "WindowsPhone" CACHE STRING "")
MESSAGE(STATUS "CMAKE_SYSTEM_NAME:" ${CMAKE_SYSTEM_NAME})

SET(CMAKE_SYSTEM_VERSION 8.1 CACHE STRING "")
MESSAGE(STATUS "CMAKE_SYSTEM_VERSION:" ${CMAKE_SYSTEM_VERSION})

INCLUDE(${CMAKE_CURRENT_LIST_DIR}/utils.cmake)

set_common_defines()
set_paths()

if (${PROJECT_NAME} MATCHES libwebsockets)
    MESSAGE(STATUS "Setting default setup for libwebsockets")
    setup_libwebsockets()
ENDIF()

if (${PROJECT_NAME} MATCHES jsoncpp)
    MESSAGE(STATUS "Setting default setup for jsoncpp")
    setup_jsoncpp()
ENDIF()

if (${PROJECT_NAME} MATCHES chatServerApp OR ${PROJECT_NAME} MATCHES chatClientAPI)
    MESSAGE(STATUS "Setting default setup for chat related project")
    setup_chat_utils_path()
ENDIF()