include template.mk
SUBDIRS=general switch top

.SUFFIX:
.PHONY: all clean open

all: clean
	list='$(SUBDIRS)'; for subdir in $$list; do \
	$(MAKE) all -C $$subdir || exit 1;\
	echo "exec make all in the $$subdir directory.";\
	done

open:
	open out.vcd
