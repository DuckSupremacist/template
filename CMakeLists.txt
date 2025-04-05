cmake_minimum_required(VERSION 3.22)

# TODO: Replace <project_name> with your project name
set(PROJECT_NAME <project_name>)
project(
    ${PROJECT_NAME}
    VERSION 1.0
    LANGUAGES CXX
)

# TODO: Replace <exec_name> with your executable name
set(EXEC_NAME <exec_name>)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(GNUInstallDirs)

file(
    GLOB_RECURSE
    SOURCE_FILES
    "src/*.cpp"
)

add_executable(${EXEC_NAME} ${SOURCE_FILES})

target_include_directories(
    ${EXEC_NAME}
    PRIVATE ${PROJECT_SOURCE_DIR}/include
            ${PROJECT_BINARY_DIR}/include
)

target_compile_options(
    ${EXEC_NAME}
    PUBLIC -O3
           -Wall
           -Woverloaded-virtual
           -Wno-unused-function
           -Wmissing-declarations
           -Werror
)

# Option to build tests
option(
    BUILD_TESTS
    "Build the tests"
    ON
)
if(BUILD_TESTS)
    add_subdirectory(tests)
endif()
