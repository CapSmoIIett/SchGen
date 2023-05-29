
#include "grouplistmodel.h"

GroupListModel::GroupListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    /*v_Groups.push_back({0, "950501"});
    v_Groups.push_back({0, "950502"});
    v_Groups.push_back({0, "950503"});
    v_Groups.push_back({0, "950504"});
    v_Groups.push_back({0, "950505"});*/
}

int GroupListModel::rowCount(const QModelIndex &parent) const
{
    //return v_Groups.size();
}

QHash<int, QByteArray> GroupListModel::roleNames() const
{
    return {{Qt::DisplayRole, "display"}};
}

int GroupListModel::count ()
{
    //return v_Groups.count();
}

QVariant GroupListModel::data(const QModelIndex &index, int role) const
{
    //if (index.row() >= v_Groups.size() && role == Qt::DisplayRole)
        return QVariant("");

    //auto group = v_Groups[index.row()];

    //return group.name;
}

void GroupListModel::addData(QString name)
{
    //qDebug() << v_Groups.size() << name;

    if (name.isEmpty())
        return;

    beginInsertRows(QModelIndex(), rowCount(), rowCount());

    //v_Groups.push_back({0, name});

    endInsertRows();

    //emit dataChanged(index(0, 0), index(v_Groups.size() - 1), {Qt::DisplayRole});
}

void GroupListModel::removeData(int row)
{

    //if (row >= v_Groups.size())
        return;


    beginRemoveRows(QModelIndex(), rowCount(), rowCount());
    //v_Groups.erase(v_Groups.begin() + row);
    endRemoveRows();
}
