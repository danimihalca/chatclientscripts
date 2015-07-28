SET(CMAKE_SYSTEM_NAME ${CMAKE_HOST_SYSTEM_NAME} CACHE STRING "")
MESSAGE(STATUS "CMAKE_SYSTEM_NAME:" ${CMAKE_SYSTEM_NAME})

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