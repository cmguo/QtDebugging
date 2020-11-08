#ifndef REMOTELOGAPPENDER_H
#define REMOTELOGAPPENDER_H

#include <qlogappender.h>
#include <data/localhttpserver.h>

class RemoteLogAppender : public QLogAppender, LocalHttpServer::LocalProgram
{
    Q_OBJECT
public:
    explicit RemoteLogAppender(QObject *parent = nullptr);

public:
    void append(const QString &message);
};

#endif // REMOTELOGAPPENDER_H
