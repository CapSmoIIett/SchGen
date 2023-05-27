
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

QVariant WeekModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    return QVariant();
}

