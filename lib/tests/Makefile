top_srcdir		?= ../..

include $(top_srcdir)/include/mk/env_pre.mk

CFLAGS			+= -W -pthread
LDLIBS			+= -lltp -lpthread

tst_cleanup_once: CFLAGS += -pthread

include $(top_srcdir)/include/mk/generic_leaf_target.mk
