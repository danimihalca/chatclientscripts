
function(set_common_defines)

    IF (DEFINED ENV{WORKSPACE})
        SET(WORKSPACE "$ENV{WORKSPACE}" CACHE PATH "")
        MESSAGE(STATUS "WORKSPACE:" ${WORKSPACE} "(ENVIRONMENT VARIABLE)")
    ELSE()
        IF(CMAKE_HOST_SYSTEM_NAME MATCHES Linux)
            SET(WORKSPACE "/home/ice/thesis" CACHE PATH "")
        ELSE()
            SET(WORKSPACE "D:/thesis" CACHE PATH "")
        ENDIF()
        MESSAGE(STATUS "WORKSPACE:" ${WORKSPACE} "(PREDEFINED)")
    ENDIF()

    if(NOT CMAKE_BUILD_TYPE)
        SET(CMAKE_BUILD_TYPE Debug CACHE STRING "" FORCE)
    endif()
    MESSAGE(STATUS "CMAKE_BUILD_TYPE:" ${CMAKE_BUILD_TYPE})

    IF (CMAKE_SYSTEM_NAME MATCHES Android)
        IF (DEFINED ENV{ANDROID_NDK})
            SET(ANDROID_NDK "$ENV{ANDROID_NDK}")
            MESSAGE(STATUS "ANDROID_NDK:" ${ANDROID_NDK}  "(ENVIRONMENT VARIABLE)")
        ELSE()
            IF(CMAKE_HOST_SYSTEM_NAME MATCHES Linux)
                SET(ANDROID_NDK "/opt/android-ndk-r10e" CACHE PATH "")
            ELSE()
                SET(ANDROID_NDK "C:/android-ndk-r10e" CACHE PATH "")
            ENDIF()
            MESSAGE(STATUS "ANDROID_NDK:" ${ANDROID_NDK} "(PREDEFINED)")
        ENDIF()

        SET(ANDROID_CMAKE_PATH "${WORKSPACE}/repositories/scripts/android-cmake" CACHE PATH "")
        MESSAGE(STATUS "ANDROID_CMAKE_PATH:" ${ANDROID_CMAKE_PATH})
    ENDIF()
endfunction()


function(set_paths)
    SET(CMAKE_INSTALL_PREFIX "${WORKSPACE}/dist" CACHE PATH "")
    SET(HEADERS_INSTALL_DIR include CACHE PATH "")

    IF(CMAKE_SYSTEM_NAME MATCHES Android)
        SET(LIBRARY_INSTALL_SUFFIX ${CMAKE_BUILD_TYPE}/${CMAKE_SYSTEM_NAME}/${ANDROID_NATIVE_API_LEVEL}/${ANDROID_ABI} CACHE PATH "")
    ELSE()
        SET(LIBRARY_INSTALL_SUFFIX ${CMAKE_BUILD_TYPE}/${CMAKE_SYSTEM_NAME} CACHE PATH "")
    ENDIF()

    SET(LIBRARY_INSTALL_DIR lib/${LIBRARY_INSTALL_SUFFIX} CACHE PATH "")
    SET(LIBRARY_INSTALL_PATH ${CMAKE_INSTALL_PREFIX}/${LIBRARY_INSTALL_DIR} CACHE PATH "")
    SET(HEADERS_INSTALL_PATH ${CMAKE_INSTALL_PREFIX}/${HEADERS_INSTALL_DIR} CACHE PATH "")

    MESSAGE(STATUS "HEADERS_INSTALL_PATH:" ${HEADERS_INSTALL_PATH})
    MESSAGE(STATUS "LIBRARY_INSTALL_PATH:" ${LIBRARY_INSTALL_PATH})

endfunction()

function(setup_libwebsockets)
    SET(LWS_WITH_SSL OFF CACHE BOOL "")

    SET(LWS_WITHOUT_TESTAPPS ON CACHE BOOL "")
    SET(LWS_WITHOUT_TEST_SERVER ON CACHE BOOL "")
    SET(LWS_WITHOUT_TEST_SERVER_EXTPOLL ON CACHE BOOL "")
    SET(LWS_WITHOUT_TEST_PING ON CACHE BOOL "")
    SET(LWS_WITHOUT_TEST_CLIENT ON CACHE BOOL "")
    SET(LWS_WITHOUT_TEST_FRAGGLE ON CACHE BOOL "")
    SET(LWS_IPV6 OFF CACHE BOOL "")

    IF(CMAKE_BUILD_TYPE MATCHES Debug)
        SET(LWS_WITHOUT_DEBUG OF CACHE BOOL "")
    ELSE()
        SET(LWS_WITHOUT_DEBUG ON CACHE BOOL "")
    ENDIF()

    SET(LWS_INSTALL_INCLUDE_DIR ${HEADERS_INSTALL_DIR} CACHE PATH "")
    SET(LWS_INSTALL_LIB_DIR ${LIBRARY_INSTALL_DIR} CACHE PATH "" FORCE)
    SET(LWS_INSTALL_BIN_DIR ${LWS_INSTALL_LIB_DIR} CACHE PATH "" FORCE)
    SET(LWS_INSTALL_CMAKE_DIR ${PROJECT_BINARY_DIR} CACHE PATH "")

endfunction()


function(setup_jsoncpp)
    SET(JSONCPP_WITH_TESTS OFF CACHE BOOL "")
    SET(JSONCPP_WITH_POST_BUILD_UNITTEST OFF CACHE BOOL "")
    SET(JSONCPP_WITH_PKGCONFIG_SUPPORT OFF CACHE BOOL "")
    SET(BUILD_STATIC_LIBS OFF CACHE BOOL "")
    SET(BUILD_SHARED_LIBS ON CACHE BOOL "")
    SET(LIB_SUFFIX /${LIBRARY_INSTALL_SUFFIX} CACHE STRING "")
endfunction()

function(setup_json_protocol_path)
    SET(COMMON_JSON_CHAT_PROTOCOl_PATH ${WORKSPACE}/repositories/JsonChatProtocol CACHE STRING "")
endfunction()