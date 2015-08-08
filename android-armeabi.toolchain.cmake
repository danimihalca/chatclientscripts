SET(CMAKE_SYSTEM_NAME "Android" CACHE STRING "")
MESSAGE(STATUS "CMAKE_SYSTEM_NAME:" ${CMAKE_SYSTEM_NAME})

INCLUDE(${CMAKE_CURRENT_LIST_DIR}/utils.cmake)

set_common_defines()

if (NOT DEFINED ANDROID_NATIVE_API_LEVEL)
    SET (ANDROID_NATIVE_API_LEVEL 9 CACHE INT "" FORCE)
endif()
SET (ANDROID_ABI "armeabi" CACHE STRING "")

set_paths()

include(${ANDROID_CMAKE_PATH}/android.toolchain.cmake)

if (${PROJECT_NAME} MATCHES libwebsockets)
    MESSAGE(STATUS "Setting default setup for libwebsockets")
    setup_libwebsockets()
ENDIF()

if (${PROJECT_NAME} MATCHES jsoncpp)
    MESSAGE(STATUS "Setting default setup for jsoncpp")
    setup_jsoncpp()
ENDIF()

if (${PROJECT_NAME} MATCHES chatServerApp OR ${PROJECT_NAME} MATCHES chatClientAPI  OR ${PROJECT_NAME} MATCHES chatClientJNI)
    MESSAGE(STATUS "Setting default setup for chat project")
    setup_chat_utils_path()
ENDIF()
