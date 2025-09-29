#include "contactmodel.h"


Contact::Contact(const QString &name, const QString &number)
    : m_name(name), m_number(number)
{

}

QString Contact::name() const
{
    return m_name;
}

QString Contact::number() const
{
    return m_number;
}



ContactModel::ContactModel(QObject *parent)
    : QAbstractListModel{parent}
{

}

void ContactModel::addContact(const Contact &contact)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_contacts << contact;
    endInsertRows();
}

int ContactModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_contacts.count();
}

QVariant ContactModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_contacts.count())
        return QVariant();

    const Contact &contact = m_contacts[index.row()];
    if (role == NameRole)
        return contact.name();
    else if (role == NumberRole)
        return contact.number();
    return QVariant();
}

QHash<int, QByteArray> ContactModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[NumberRole] = "number";
    return roles;
}




