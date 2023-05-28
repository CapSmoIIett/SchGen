#pragma once


#include <QAbstractListModel>
#include <QObject>
#include <qqml.h>
#include <QVector>

#include "../datastructures.h"


class GroupListModel : public QAbstractListModel
{
    Q_OBJECT
    //QML_ELEMENT

public:
    GroupListModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data( const QModelIndex& index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    //Q_INVOKABLE void DataAdd();

private:
    QVector<Group> v_Groups;
};


