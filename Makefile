SUBDIRS := wyklady

.PHONY: all participant sol clean clean-pdf $(SUBDIRS)

all participant sol clean clean-pdf:
	+$(MAKE) -C wyklady $@

$(SUBDIRS):
	+$(MAKE) -C $@
