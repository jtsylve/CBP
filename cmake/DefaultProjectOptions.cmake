
# SPDX-FileCopyrightText: © 2023 Joe T. Sylve, Ph.D. <joe.sylve@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.21)

if(PROJECT_IS_TOP_LEVEL)
    string(TOUPPER ${PROJECT_NAME} PROJECT_NAME_UPPER)

    option(${PROJECT_NAME_UPPER}_ENABLE_COMPILER_CACHE "CCache Support" ON)
    if (${PROJECT_NAME_UPPER}_ENABLE_COMPILER_CACHE)
        include(EnableCompilerCache)
        enableCompilerCache()
    endif()

    option(${PROJECT_NAME_UPPER}_ENABLE_IPO "Interprocedural Optimization Support" ON)
    if (${PROJECT_NAME_UPPER}_ENABLE_IPO)
        include(EnableIPO)
        enableIPO()
    endif()

    option(${PROJECT_NAME_UPPER}_ENABLE_CLANG_TIDY "Clang Tidy Support" ON)
    if (${PROJECT_NAME_UPPER}_ENABLE_CLANG_TIDY)
        include(EnableClangTidy)
        enableClangTidy()
    endif()

endif(PROJECT_IS_TOP_LEVEL)