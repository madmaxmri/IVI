#ifndef PLAYERCONTROLLER_H
#define PLAYERCONTROLLER_H

#include <QMediaPlayer>
#include <QAbstractListModel>
#include <QList>
#include "AudioInfo.h"

class PlayerController : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged FINAL)
    Q_PROPERTY(AudioInfo* currentSong READ currentSong WRITE setCurrentSong NOTIFY currentSongChanged FINAL)

public:
    enum Role {
        AudioTitleRole = Qt::UserRole + 1,
        AudioAuthorNameRole,
        AudioSourceRole,
        AudioImageSourceRole
    };

    explicit PlayerController(QObject *parent = nullptr);

    bool playing() const;
    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

    AudioInfo *currentSong() const;
    void setCurrentSong(AudioInfo *newCurrentSong);

public slots:
    void switchToNextSong();
    void switchToPreviousSong();
    void playPause();
    void changeAudioSource(const QUrl &source);
    void addAudio(const QString& title,
                  const QString& authorName,
                  const QUrl& audioSource,
                  const QUrl& imageSource);
    void removeAudio(int index);
    void switchToAudioByIndex(int index);

signals:
    void playingChanged();

    void currentSongChanged();

private:
    bool m_playing = false;
    QMediaPlayer m_mediaPlayer;
    QList<AudioInfo*> m_audioList;
    AudioInfo *m_currentSong = nullptr;
};

#endif // PLAYERCONTROLLER_H
