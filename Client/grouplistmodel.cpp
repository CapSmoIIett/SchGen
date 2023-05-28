
#include "grouplistmodel.h"

GroupListModel::GroupListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    v_Groups.push_back({0, "950501"});
    v_Groups.push_back({0, "950502"});
    v_Groups.push_back({0, "950503"});
    v_Groups.push_back({0, "950504"});
    v_Groups.push_back({0, "950505"});
}

int GroupListModel::rowCount(const QModelIndex &parent) const
{
    return v_Groups.size();
}

QHash<int, QByteArray> GroupListModel::roleNames() const
{
    return {{Qt::DisplayRole, "display"}};
}

QVariant GroupListModel::data(const QModelIndex &index, int role) const
{
    if (index.row() >= v_Groups.size() && role == Qt::DisplayRole)
        return QVariant("");

    qDebug();
    qDebug() << "GroupListModel::data " << index << role;

    auto group = v_Groups[index.row()];

    return group.name;
}
