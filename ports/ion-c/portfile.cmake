vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO amazon-ion/ion-c
    REF "v${VERSION}"
    SHA512 3a77769368b4903934f02811ad7c3ec2fb13d8e2e36c2c6d65879e8eb9f846135d3c7038f6e31750c08755a7d1989b3dca114a0edb58a323d434b438cb90a9ab
    HEAD_REF master
    PATCHES remove-tests-and-tools.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME IonC
    CONFIG_PATH lib/cmake/IonC
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
)

vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
