#ifndef AUDIOINFO_H
#define AUDIOINFO_H

#include <QObject>
#include <QUrl>
#include <QtQml/qqmlregistration.h>


class AudioInfo : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int songIndex READ songIndex WRITE setSongIndex NOTIFY songIndexChanged REQUIRED)
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged FINAL)
    Q_PROPERTY(QString authorName READ authorName WRITE setAuthorName NOTIFY authorNameChanged FINAL)
    Q_PROPERTY(QUrl imageSource READ imageSource WRITE setImageSource NOTIFY imageSourceChanged FINAL)
    Q_PROPERTY(QUrl audioSource READ audioSource WRITE setAudioSource NOTIFY audioSourceChanged REQUIRED)
    QML_ELEMENT

public:
    explicit AudioInfo(QObject *parent = nullptr);


    int songIndex() const;
    void setSongIndex(int newSongIndex);

    QString title() const;
    void setTitle(const QString &newTitle);

    QString authorName() const;
    void setAuthorName(const QString &newAuthorName);

    QUrl imageSource() const;
    void setImageSource(const QUrl &newImageSource);

    QUrl audioSource() const;
    void setAudioSource(const QUrl &newAudioSource);

signals:


    void songIndexChanged();

    void titleChanged();

    void authorNameChanged();

    void imageSourceChanged();

    void audioSourceChanged();

private:

    int m_songIndex;
    QString m_title;
    QString m_authorName;
    QUrl m_imageSource;
    QUrl m_audioSource;
};

#endif // AUDIOINFO_H
