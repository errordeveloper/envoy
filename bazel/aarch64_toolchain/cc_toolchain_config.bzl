load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
     "feature",
     "flag_group",
     "flag_set",
     "tool_path")
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")

def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = "/usr/bin/aarch64-linux-gnu-gcc",
        ),
        tool_path(
            name = "ld",
            path = "/usr/bin/aarch64-linux-gnu-ld",
        ),
        tool_path(
            name = "ar",
            path = "/usr/bin/aarch64-linux-gnu-ar",
        ),
        tool_path(
            name = "cpp",
            path = "/usr/bin/aarch64-linux-gnu-cpp",
        ),
        tool_path(
            name = "gcov",
            path = "/usr/bin/aarch64-linux-gnu-gcov",
        ),
        tool_path(
            name = "nm",
            path = "/usr/bin/aarch64-linux-gnu-nm",
        ),
        tool_path(
            name = "objcopy",
            path = "/usr/bin/aarch64-linux-gnu-objcopy",
        ),
        tool_path(
            name = "objdump",
            path = "/usr/bin/aarch64-linux-gnu-objdump",
        ),
        tool_path(
            name = "strip",
            path = "/usr/bin/aarch64-linux-gnu-strip",
        ),
    ]
    
    features = [
        feature(
            name = "default_linker_flags",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = [
                        ACTION_NAMES.cpp_link_executable,
                        ACTION_NAMES.cpp_link_dynamic_library,
                        ACTION_NAMES.cpp_link_nodeps_dynamic_library,
                    ],
                    flag_groups = ([
                        flag_group(
                            flags = [
                                "-lstdc++",
                            ],
                        ),
                    ]),
                ),
            ],
        ),
    ]
    #toolchain_include_directories_feature = feature(
    #    name = "toolchain_include_directories",
    #    enabled = True,
    #    flag_sets = [
    #        flag_set(
    #            actions = [
    #                ACTION_NAMES.assemble,
    #                ACTION_NAMES.preprocess_assemble,
    #                ACTION_NAMES.linkstamp_compile,
    #                ACTION_NAMES.c_compile,
    #                ACTION_NAMES.cpp_compile,
    #                ACTION_NAMES.cpp_header_parsing,
    #                ACTION_NAMES.cpp_module_compile,
    #                ACTION_NAMES.cpp_module_codegen,
    #                ACTION_NAMES.lto_backend,
    #                ACTION_NAMES.clif_match,
    #            ],
    #            flag_groups = [
    #                flag_group(
    #                    flags = [
    #                        "-isystem",
    #                        "external/emscripten_toolchain/system/include/libcxx",
    #                        "-isystem",
    #                        "external/emscripten_toolchain/system/include/libc",
    #                    ],
    #                ),
    #            ],
    #        ),
    #    ],
    #)
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "aarch64-linux-gnu",
        host_system_name = "aarch64",
        target_system_name = "aarch64",
        target_cpu = "aarch64",
        target_libc = "aarch64",
        compiler = "aarch64",
        abi_version = "aarch64",
        abi_libc_version = "aarch64",
        tool_paths = tool_paths,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
