
# SPDX-FileCopyrightText: © 2023 Joe T. Sylve, Ph.D. <joe.sylve@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.9)

include(CheckIPOSupported)

function(enableIPO)
    message(STATUS "Checking for IPO support")

    # Check if IPO is supported
    check_ipo_supported(RESULT IPO_SUPPORTED OUTPUT IPO_SUPPORT_OUTPUT)
    if(NOT IPO_SUPPORTED)
        message(NOTICE "IPO is not supported: ${IPO_SUPPORT_OUTPUT}")
        return()
    endif()

    # Enable IPO for all targets
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE PARENT_SCOPE)

    message(STATUS "IPO enabled")
endfunction()
