@test "pkgs: rpm" {
     "${WORKSPACE}/src/run.py" "${BATS_TEST_DIRNAME}/packages/rpm/simple" --dist sl15.6
}

@test "pkgs: debian native source package" {
     # create source package
     cd "${BATS_TEST_DIRNAME}/packages/debian/simple-native/simple"
     dpkg-source -b .
     cd ..
     "${WORKSPACE}/src/run.py" . --dist debian12 --vm-type chroot
}
