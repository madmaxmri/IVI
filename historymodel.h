#ifndef HISTORYMODEL_H
#define HISTORYMODEL_H

#include "contactmodel.h"
#include <QObject>
#include <QAbstractListModel>

class History
{
public:
    History(const Contact &contact, const QString &time);
    QString name() const;
    QString number() const;
    QString time() const;

private:
    Contact m_contact;
    QString m_time;
};

class HistoryModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum HistortyRoles {
        NameRole = Qt::UserRole + 1,
        NumberRole,
        TimeRole
    };

    explicit HistoryModel(QObject *parent = nullptr);

    void addHistory(const History &history);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<History> m_history;

signals:
};

#endif // HISTORYMODEL_H
