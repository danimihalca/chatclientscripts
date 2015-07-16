
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/defines.cmake)

set_common_defines()

MESSAGE(STATUS "TARGET SYSTEM:" ${CMAKE_SYSTEM_NAME})
MESSAGE(STATUS "BUILD TYPE:" ${CMAKE_BUILD_TYPE})


if(${CMAKE_SYSTEM_NAME} MATCHES Android)
    if (NOT DEFINED ANDROID_NATIVE_API_LEVEL)
        SET (ANDROID_NATIVE_API_LEVEL 9)
    endif()
    if (NOT DEFINED ANDROID_ABI)
        SET (ANDROID_ABI armeabi)
    endif()
    include(${ANDROID_CMAKE_PATH}/android.toolchain.cmake)

    MESSAGE(STATUS "ANDROID NDK API:" ${ANDROID_NATIVE_API_LEVEL})
    MESSAGE(STATUS "ANDROID ABI:" ${ANDROID_ABI})

elseif(${CMAKE_SYSTEM_NAME} MATCHES WindowsPhone)
    SET(CMAKE_SYSTEM_VERSION 8.1)
    SET(CMAKE_GENERATOR "Visual Studio 12 2013 ARM" CACHE INTERNAL "" FORCE)
endif()

set_paths()

if (${PROJECT_NAME} MATCHES libwebsockets)
    MESSAGE(STATUS "Setting default setup for libwebsockets")
    setup_libwebsockets()
ENDIF()