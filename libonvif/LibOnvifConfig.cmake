find_package(LibXml2 REQUIRED)

link_directories(${LibXml2_INCLUDE_DIRS})

include("${CMAKE_CURRENT_LIST_DIR}/LibOnvifConfigVersion.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/LibOnvifTargets.cmake")
