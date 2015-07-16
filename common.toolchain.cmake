
if(DEFINED TARGET_SYSTEM)
    MESSAGE(STATUS "Generic target for cross compiling")
    SET(CMAKE_SYSTEM_NAME Generic)
ELSE()
    MESSAGE(STATUS "Targeting:" ${TARGET_SYSTEM})
    SET(TARGET_SYSTEM ${CMAKE_HOST_SYSTEM_NAME} CACHE STRING "")
    SET(CMAKE_SYSTEM_NAME ${CMAKE_HOST_SYSTEM} CACHE STRING "")
ENDIF()


INCLUDE(${CMAKE_CURRENT_LIST_DIR}/defines.cmake)

set_common_defines()

MESSAGE(STATUS "TARGET SYSTEM:" ${TARGET_SYSTEM})
MESSAGE(STATUS "BUILD TYPE:" ${CMAKE_BUILD_TYPE})

set_paths()

if(${TARGET_SYSTEM} MATCHES "Android")
    if (NOT DEFINED ANDROID_NATIVE_API_LEVEL)
        SET (ANDROID_NATIVE_API_LEVEL 9 CACHE INT "" FORCE)
    endif()
    if (NOT DEFINED ANDROID_ABI)
        SET (ANDROID_ABI "armeabi" CACHE STRING "" FORCE)
    endif()
    include(${ANDROID_CMAKE_PATH}/android.toolchain.cmake)

    MESSAGE(STATUS "ANDROID NDK API:" ${ANDROID_NATIVE_API_LEVEL})
    MESSAGE(STATUS "ANDROID ABI:" ${ANDROID_ABI})

elseif(${TARGET_SYSTEM} MATCHES WindowsPhone)
    #cmake build and install using msvc
    # cmake --build . --target install <--config -- "/p:Platform=ARM">
    SET(CMAKE_SYSTEM_VERSION 8.1)
    SET(CMAKE_SYSTEM_NAME ${TARGET_SYSTEM} CACHE STRING "")
    #SET(CMAKE_GENERATOR "Visual Studio 12 2013 ARM" CACHE INTERNAL "" FORCE) #run cmake twice when set only here, lazy generator set
    #SET(CMAKE_SHARED_LINKER_FLAGS "/machine:ARM") #not needed when setting the generator as argument
endif()

if (${PROJECT_NAME} MATCHES libwebsockets)
    MESSAGE(STATUS "Setting default setup for libwebsockets")
    setup_libwebsockets()
ENDIF()
