package(default_visibility = ['//visibility:public'])

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

cc_toolchain_config(name = "cross_aarch64_toolchain_config")

cc_toolchain_suite(
    name = "aarch64",
    toolchains = {
        "aarch64": ":cross_aarch64_toolchain",
    },
)

cc_toolchain(
    name = "cross_aarch64_toolchain",
    toolchain_identifier = "aarch64-linux-gnu",
    toolchain_config = ":cross_aarch64_toolchain_config",
    all_files = ":all",
    compiler_files = ":all",
    dwp_files = ":all",
    linker_files = ":all",
    objcopy_files = ":all",
    strip_files = ":all",
    supports_param_files = 0,
)
