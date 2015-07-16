SET(CMAKE_SYSTEM_NAME "Android" CACHE STRING "" FORCE)
MESSAGE(STATUS "CMAKE_SYSTEM_NAME:" ${CMAKE_SYSTEM_NAME})

INCLUDE(${CMAKE_CURRENT_LIST_DIR}/utils.cmake)

set_common_defines()

if (NOT DEFINED ANDROID_NATIVE_API_LEVEL)
    SET (ANDROID_NATIVE_API_LEVEL 9 CACHE INT "" FORCE)
endif()
SET (ANDROID_ABI "armeabi-v7a" CACHE STRING "")

set_paths()

include(${ANDROID_CMAKE_PATH}/android.toolchain.cmake)

if (${PROJECT_NAME} MATCHES libwebsockets)
    MESSAGE(STATUS "Setting default setup for libwebsockets")
    setup_libwebsockets()
ENDIF()
