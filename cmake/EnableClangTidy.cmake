
# SPDX-FileCopyrightText: © 2023 Joe T. Sylve, Ph.D. <joe.sylve@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.25)

function(enableClangTidy)
    message(STATUS "Checking for clang-tidy")

    # On macOS, clang-tidy is installed via Homebrew, but the path to the
    # binaries is not added to the PATH environment variable. We need to
    # find the path to the Homebrew installation and add it to the PATH.
    find_program(HOMEBREW_EXECUTABLE brew)
    if(HOMEBREW_EXECUTABLE)
        exec_program(${HOMEBREW_EXECUTABLE}
            ARGS --prefix llvm
            OUTPUT_VARIABLE HOMEBREW_LLVM_PREFIX)

        set(HOMEBREW_LLVM_BIN_PATH ${HOMEBREW_LLVM_PREFIX}/bin)
    endif()

    # Locate clang-tidy
    find_program(CLANG_TIDY_EXECUTABLE clang-tidy
        PATHS ${HOMEBREW_LLVM_BIN_PATH})
        
    if(NOT CLANG_TIDY_EXECUTABLE)
        message(NOTICE "clang-tidy not found")
        return()
    endif()

    message(STATUS "Found clang-tidy: ${CLANG_TIDY_EXECUTABLE}")

    set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

    # Enable clang-tidy for all targets
    foreach(lang IN ITEMS C CXX OBJC OBJCXX)
        set(CMAKE_${lang}_CLANG_TIDY ${CLANG_TIDY_EXECUTABLE} -p ${CMAKE_BINARY_DIR} PARENT_SCOPE)
    endforeach()

    find_program(RUN_CLANG_TIDY_EXECUTABLE run-clang-tidy)
    if (RUN_CLANG_TIDY_EXECUTABLE)
      add_custom_target(run-clang-tidy
          COMMAND ${RUN_CLANG_TIDY_EXECUTABLE}
              -clang-tidy-binary ${CLANG_TIDY_EXECUTABLE}
              -p ${CMAKE_BINARY_DIR})
    endif()
    
    message(STATUS "clang-tidy support enabled")
endfunction()