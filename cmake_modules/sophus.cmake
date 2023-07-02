set(URL https://github.com/strasdat/Sophus.git)
set(VERSION a621ff2e56c56c839a6c40418d42c3c254424b5c)

set(sophus_INCLUDE_DIR ${CMAKE_BINARY_DIR}/3rd_party/src/sophus_external)
set(sophus_LIBS ${CMAKE_BINARY_DIR}/3rd_party/src/sophus_external-build/install/lib/libSophus${CMAKE_SHARED_LIBRARY_SUFFIX})

get_target_property(eigen_INCLUDE_DIRS eigen INTERFACE_INCLUDE_DIRECTORIES)
get_filename_component(eigen_cmake "${eigen_INCLUDE_DIRS}/../../share/eigen3/cmake" ABSOLUTE)

if (NOT EXISTS ${sophus_LIBS})
    externalproject_add(sophus_external
            DEPENDS eigen
            GIT_REPOSITORY ${URL}
            GIT_TAG        ${VERSION}
            CMAKE_ARGS
                -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
                -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
                -DCMAKE_BUILD_TYPE=Release
                -DCMAKE_INSTALL_PREFIX=./install
                -DCMAKE_CXX_FLAGS="-Wno-int-in-bool-context"
                -DEigen3_DIR=${eigen_cmake}
            TEST_COMMAND ""
            PREFIX 3rd_party
            EXCLUDE_FROM_ALL 1
            )
    file(MAKE_DIRECTORY ${sophus_INCLUDE_DIR})
endif()

add_library(sophus INTERFACE IMPORTED GLOBAL)
add_dependencies(sophus sophus_external)

target_include_directories(sophus INTERFACE ${sophus_INCLUDE_DIR} ${eigen_INCLUDE_DIR})

target_link_libraries(sophus INTERFACE ${sophus_LIBS})