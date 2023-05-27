
#include "monthmodel.h"


MonthModel::MonthModel(QObject *parent)
    : QAbstractTableModel(parent)
{
}

QVariant MonthModel::headerData(int section, Qt::Orientation orientation, int role) const
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

int MonthModel::rowCount(const QModelIndex &parent) const
{
    return CalendarCtrl::GetNumbersOfDays(0, 0) + CalendarCtrl::GetDayOfWeekByDate(1, 0, 0) + 1 > 35 ? 6 : 5;
}

int MonthModel::columnCount(const QModelIndex &parent) const
{
    return 7;

    // FIXME: Implement me!
}

QVariant MonthModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    return QVariant();
}

