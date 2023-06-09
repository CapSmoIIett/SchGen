#pragma once


#include <QAbstractItemModel>
#include <QAbstractTableModel>

#include "calendarctrl.h"


class WeekModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit WeekModel(QObject *parent = nullptr);

    enum Role {
        Display = Qt::DisplayRole,
        Existence = Qt::UserRole,
        Begin,
        Duration
    };

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    QHash<int, QByteArray> roleNames() const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

private:
};


