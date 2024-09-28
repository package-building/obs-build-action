@test "dist: sl15.6" {
     "${WORKSPACE}/src/run.py" "${BATS_TEST_DIRNAME}/packages/rpm/simple" --dist sl15.6
}

@test "dist: sl15.6, provided as url" {
     "${WORKSPACE}/src/run.py" "${BATS_TEST_DIRNAME}/packages/rpm/simple" --dist "https://raw.githubusercontent.com/openSUSE/obs-build/refs/tags/20240913/configs/sl15.6.conf"
}

@test "dist: sl15.6, provided as file" {
     "${WORKSPACE}/src/run.py" "${BATS_TEST_DIRNAME}/packages/rpm/simple" --dist "/usr/lib/build/configs/sl15.6.conf"
}

@test "dist: tumbleweed" {
     "${WORKSPACE}/src/run.py" "${BATS_TEST_DIRNAME}/packages/rpm/simple" --dist tumbleweed
}
