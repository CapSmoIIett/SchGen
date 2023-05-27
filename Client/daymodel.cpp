
#include "daymodel.h"



DayModel::DayModel(QObject *parent)
    : QAbstractTableModel(parent)
{
}

QVariant DayModel::headerData(int section, Qt::Orientation orientation, int role) const
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

int DayModel::rowCount(const QModelIndex &parent) const
{
    return 24;
}

int DayModel::columnCount(const QModelIndex &parent) const
{
    return 1;

    // FIXME: Implement me!
}

QVariant DayModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    return QVariant();
}


