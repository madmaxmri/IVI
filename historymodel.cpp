#include "historymodel.h"


History::History(const Contact &contact, const QString &time)
    : m_contact(contact), m_time(time)
{

}

QString History::name() const
{
    return m_contact.name();
}

QString History::number() const
{
    return m_contact.number();
}

QString History::time() const
{
    return m_time;
}

HistoryModel::HistoryModel(QObject *parent)
    : QAbstractListModel{parent}
{

}

void HistoryModel::addHistory(const History &history)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_history << history;
    endInsertRows();
}

int HistoryModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_history.count();
}

QVariant HistoryModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_history.count())
        return QVariant();

    const History &history = m_history[index.row()];
        if (role == NameRole)
            return history.name();
        else if (role == NumberRole)
            return history.number();
        else if (role == TimeRole)
            return history.time();
        return QVariant();
}

QHash<int, QByteArray> HistoryModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[NumberRole] = "number";
    roles[TimeRole] = "time";
    return roles;
}

