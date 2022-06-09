add_compile_options(-Wall -nostdlib)

set(TPM2TIS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src/drivers/spi/tpm/)
set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src/include/)
set(CONFIG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../build/)
set(COMMON_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src/commonlib/include/)
set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src/lib/)
set(BSD_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src/commonlib/bsd/include/)
set(ARM_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src/arch/arm/include/)
set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src/)

set(CONFIG_FILE ${CMAKE_CURRENT_SOURCE_DIR}/../build/config.h)
set(KCONFIG_FILE ${CMAKE_CURRENT_SOURCE_DIR}/../src/include/kconfig.h)
set(RULES_FILE ${CMAKE_CURRENT_SOURCE_DIR}/../src/include/rules.h)

set(TPM2TIS_FILES ${TPM2TIS_DIR}/tis.c
                  ${TPM2TIS_DIR}/tpm.c
                  ${LIB_DIR}/delay.c
                  ${CMAKE_CURRENT_SOURCE_DIR}/src/port.c
)

message(STATUS "TPM2TIS_FILES: ${TPM2TIS_FILES}")

add_library(tpm2tis STATIC
  ${TPM2TIS_FILES}
)

target_precompile_headers(tpm2tis
  PRIVATE
  ${KCONFIG_FILE}
  ${CONFIG_FILE}
  ${RULES_FILE}
)

target_include_directories(tpm2tis
  PRIVATE
  ${TPM2TIS_DIR}
  ${INCLUDE_DIR}
  ${COMMON_DIR}
  ${CONFIG_DIR}
  ${BSD_DIR}
  ${ARM_DIR}
  ${SRC_DIR}
)

target_compile_definitions(tpm2tis PUBLIC
  # the sole purpose of these configs are to pass compilation
  -D__always_inline=
  -D__DECOMPRESSOR__
)
