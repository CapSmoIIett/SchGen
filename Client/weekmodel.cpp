
#include "weekmodel.h"


WeekModel::WeekModel(QObject *parent)
    : QAbstractTableModel(parent)
{
}

QVariant WeekModel::headerData(int section, Qt::Orientation orientation, int role) const
{

    if (role != Qt::DisplayRole)
        return QVariant("");

    if (orientation == Qt::Horizontal)
    {
        if (section >= CalendarCtrl::GetLabelWeekShort().size())
            return QVariant("");
        return CalendarCtrl::GetLabelWeekShort()[section];
    }
    if (orientation == Qt::Vertical)
    {
        if (section >= CalendarCtrl::GetLabelTimeLine().size())
            return QVariant("");
        return CalendarCtrl::GetLabelTimeLine()[section];
    }
    return QVariant("");
}

int WeekModel::rowCount(const QModelIndex &parent) const
{
    return 24;
}

int WeekModel::columnCount(const QModelIndex &parent) const
{
    return 7;

    // FIXME: Implement me!
}

QHash<int, QByteArray> WeekModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    return {{Qt::DisplayRole, "display"}, {Role::Existence, "existence"}, {Role::Begin, "begin"}, {Role::Duration, "duration"}};
}

QVariant WeekModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if(index.row() == 3 && index.column() == 3)
    {
        switch (role)
        {
        case Existence: return true;
        case Begin: return 0;
        case Duration: return 1;
        }
    }
    if(index.row() == 3 && index.column() == 2)
    {
        switch (role)
        {
        case Existence: return true;
        case Begin: return 0.5;
        case Duration: return 1.5;
        }
    }

        switch (role)
        {
        case Existence: return false;
        case Begin: return 0;
        case Duration: return 0;
        }

    // FIXME: Implement me!
    return QVariant();
}

