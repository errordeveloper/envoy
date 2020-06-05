package(default_visibility = ['//visibility:public'])

load(":gcc_aarch64_cross_toolchain_config.bzl", "gcc_aarch64_cross_toolchain_config_rule")

gcc_aarch64_cross_toolchain_config_rule(name = "gcc_aarch64_cross_toolchain_config")

cc_toolchain_suite(
    name = "gcc_cross_toolchain_suite",
    toolchains = {
        "aarch64": ":gcc_aarch64_cross_toolchain",
    },
)

filegroup(
    name = "gcc_aarch64_cross_toolchain_files",
    srcs = glob([
        "aarch64-none-linux-gnu/**",
        "libexec/**",
        "lib/gcc/aarch64-none-linux-gnu/**",
        "include/**",
    ]),
)

cc_toolchain(
    name = "gcc_aarch64_cross_toolchain",
    toolchain_identifier = "aarch64-linux-gnu",
    toolchain_config = ":gcc_aarch64_cross_toolchain_config",
    all_files = ":gcc_aarch64_cross_toolchain_files",
    compiler_files = ":gcc_aarch64_cross_toolchain_files",
    dwp_files = ":empty",
    linker_files = ":gcc_aarch64_cross_toolchain_files",
    objcopy_files = ":gcc_aarch64_cross_toolchain_files",
    strip_files = ":gcc_aarch64_cross_toolchain_files",
    supports_param_files = 1,
)
