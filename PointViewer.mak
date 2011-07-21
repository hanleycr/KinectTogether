OSTYPE := $(shell uname -s)

SRC_FILES = \
	../PointViewer/stb_image.c \
	../PointViewer/main.cpp \
	../PointViewer/PointDrawer.cpp \
	../PointViewer/signal_catch.cpp 

INC_DIRS += ../PointViewer

EXE_NAME = Sample-PointViewer

ifeq "$(USE_GLES)" "1"
DEFINES = USE_GLES
USED_LIBS += GLES_CM IMGegl srv_um
SRC_FILES += \
	../PointViewer/kbhit.cpp \
	../PointViewer/opengles.cpp
else
DEFINES = USE_GLUT

ifeq ("$(OSTYPE)","Darwin")
        LDFLAGS += -framework OpenGL -framework GLUT
else
        USED_LIBS += glut
endif
endif
include ../NiteSampleMakefile

