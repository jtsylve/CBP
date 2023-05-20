cmake_minimum_required(VERSION 3.9)

include(CheckIPOSupported)

function(enableIPO)
    message(STATUS "Enabling IPO")

    # Check if IPO is supported
    check_ipo_supported(RESULT IPO_SUPPORTED OUTPUT IPO_SUPPORT_OUTPUT)
    if(NOT IPO_SUPPORTED)
        message(WARNING "IPO is not supported: ${IPO_SUPPORT_OUTPUT}")
        return()
    endif()

    # Enable IPO for all targets
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE PARENT_SCOPE)
endfunction()
