#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QAbstractListModel>
#include <QObject>

class Contact
{
public:
    Contact(const QString &name, const QString &number);
    QString name() const;
    QString number() const;

private:
    QString m_name;
    QString m_number;
};

class ContactModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum ContactRoles {
        NameRole = Qt::UserRole + 1,
        NumberRole
    };

    explicit ContactModel(QObject *parent = nullptr);

    void addContact(const Contact &contact);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<Contact> m_contacts;

signals:
};

#endif // CONTACTMODEL_H
