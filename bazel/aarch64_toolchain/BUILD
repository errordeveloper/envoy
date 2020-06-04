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
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)
