bbl_subproject_deps = \
	util \
  machine \
  dummy_payload \

bbl_hdrs = \
  bbl.h \

bbl_c_srcs = \
  logo.c \

bbl_asm_srcs = \
  payload.S \
  raw_logo.S \

payload.o: bbl_payload

bbl_payload: $(BBL_PAYLOAD)
	if $(READELF) -h $< 2> /dev/null > /dev/null; then $(OBJCOPY) -O binary $< $@; else cp $< $@; fi

raw_logo.o: bbl_logo_file

bbl_logo_file: riscv_logo.txt
	cat $^ | sed 's/$$/\r/' > $@

bbl_test_srcs =

bbl_install_prog_srcs = \
  bbl.c \
