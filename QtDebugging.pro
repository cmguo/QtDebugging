CONFIG += qt

TEMPLATE = lib
DEFINES += QTDEBUGGING_LIBRARY

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    qtdebugging.cpp \
    remotelogappender.cpp

HEADERS += \
    QtDebugging_global.h \
    qtdebugging.h \
    remotelogappender.h

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../log4qt/release/ -llog4qt
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../log4qt/debug/ -llog4qtd
else:unix: LIBS += -L$$OUT_PWD/../log4qt/ -llog4qt

INCLUDEPATH += $$PWD/../log4qt
DEPENDPATH += $$PWD/../log4qt

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../ShowBoard/release/ -lShowBoard
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../ShowBoard/debug/ -lShowBoardd
else:unix: LIBS += -L$$OUT_PWD/../ShowBoard/ -lShowBoard

INCLUDEPATH += $$PWD/../ShowBoard
DEPENDPATH += $$PWD/../ShowBoard
