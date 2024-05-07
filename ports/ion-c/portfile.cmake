set(IONC_GIT_REF e5fb7555981b52fdc1d99d01b94ad766b01ebdee)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO amazon-ion/ion-c
    REF "${IONC_GIT_REF}"
    SHA512 4380539c650882d3a901e730bfc33a959841ae1add9c83bfebdbb5032f1cd2ba3c9055ceb9a2e260c9e9f24adfae308d19890ebfc946176aa3a4107e8db3c023
    HEAD_REF master
    PATCHES fix-cmake.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
	-DIONC_GIT_REF=${IONC_GIT_REF}
	-DIONC_BUILD_TESTS=OFF
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
