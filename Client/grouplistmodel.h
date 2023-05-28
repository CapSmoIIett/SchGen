#pragma once


#include <QAbstractListModel>
#include <QObject>
#include <qqml.h>
#include <QVector>

#include "../datastructures.h"


class GroupListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ count NOTIFY countChanged)
    QML_ELEMENT

public:
    GroupListModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data( const QModelIndex& index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    int count ();

    Q_INVOKABLE void addData(QString);

signals:
    void countChanged (int);

private:
    QVector<Group> v_Groups;
};


