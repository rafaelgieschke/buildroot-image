LINUX_EXTENSIONS += uncompressed
define UNCOMPRESSED_PREPARE_KERNEL
	$(APPLY_PATCHES) $(@D) $(UNCOMPRESSED_DIR) \
		uncompressed-kernel.patch
endef
