
if(NOT DEFINED CMAKE_BUILD_TYPE)
    SET(CMAKE_BUILD_TYPE Debug)
endif()

if(NOT DEFINED ${CMAKE_SYSTEM_NAME})
    SET(CMAKE_SYSTEM_NAME ${CMAKE_HOST_SYSTEM_NAME})
ENDIF()


INCLUDE(${CMAKE_CURRENT_LIST_DIR}/defines.cmake)

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

    MESSAGE(STATUS "ANDROID NDK:" ${ANDROID_NDK})
    MESSAGE(STATUS "ANDROID NDK API:" ${ANDROID_NATIVE_API_LEVEL})
    MESSAGE(STATUS "ANDROID ABI:" ${ANDROID_ABI})
    SET(LIBRARY_INSTALL_PATH ${LIBRARY_INSTALL_PREFIX}/${CMAKE_BUILD_TYPE}/Android/${ANDROID_NATIVE_API_LEVEL}/${ANDROID_ABI})

elseif(${CMAKE_SYSTEM_NAME} MATCHES Linux)
    SET(LIBRARY_INSTALL_PATH ${LIBRARY_INSTALL_PREFIX}/${CMAKE_BUILD_TYPE}/Linux)

elseif(${CMAKE_SYSTEM_NAME} MATCHES WindowsPhone)
    SET(CMAKE_SYSTEM_VERSION 8.1)
    SET(CMAKE_GENERATOR "Visual Studio 12 2013 ARM" CACHE INTERNAL "" FORCE)
    SET(LIBRARY_INSTALL_PATH ${LIBRARY_INSTALL_PREFIX}/${CMAKE_BUILD_TYPE}/WindowsPhone)

elseif(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    SET(LIBRARY_INSTALL_PATH ${LIBRARY_INSTALL_PREFIX}/${CMAKE_BUILD_TYPE}/Windows)
endif()

SET(HEADER_INSTALL_PATH ${HEADER_INSTALL_PREFIX}/${PROJECT_NAME})


if (${PROJECT_NAME} MATCHES libwebsockets)
    MESSAGE(STATUS "Setting default setup for libwebsockets")
    INCLUDE(${CMAKE_CURRENT_LIST_DIR}/libwebsockets.setup.cmake)
ENDIF()