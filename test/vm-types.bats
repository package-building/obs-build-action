@test "vm-type: chroot" {
     "${WORKSPACE}/src/run.py" "${BATS_TEST_DIRNAME}/packages/rpm/simple" --vm-type chroot
}

@test "vm-type: kvm" {
     "${WORKSPACE}/src/run.py" "${BATS_TEST_DIRNAME}/packages/rpm/simple" --vm-type kvm
}

@test "vm-type: qemu" {
     "${WORKSPACE}/src/run.py" "${BATS_TEST_DIRNAME}/packages/rpm/simple" --vm-type qemu
}
