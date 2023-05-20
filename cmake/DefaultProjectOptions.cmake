cmake_minimum_required(VERSION 3.21)

if(PROJECT_IS_TOP_LEVEL)
    string(TOUPPER ${PROJECT_NAME} PROJECT_NAME_UPPER)

    option(${PROJECT_NAME_UPPER}_ENABLE_COMPILER_CACHE "ccache support" ON)
    if (${PROJECT_NAME_UPPER}_ENABLE_COMPILER_CACHE)
        include(EnableCompilerCache)
        enableCompilerCache()
    endif()
endif()