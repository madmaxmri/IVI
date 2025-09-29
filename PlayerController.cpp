#include <QMediaDevices>
#include <QAudioDevice>
#include <QAudioOutput>
#include "PlayerController.h"
#include "AudioInfo.h"

PlayerController::PlayerController(QObject *parent)
    : QAbstractListModel{parent}
{
    const auto &audioOutputs = QMediaDevices::audioOutputs();
    if (!audioOutputs.isEmpty()) {
        m_mediaPlayer.setAudioOutput(new QAudioOutput(&m_mediaPlayer));
    }

    addAudio("With You",
             "AP Dhillon",
             QUrl("HMI/assets/audio/With_You.mp3"),
             QUrl("HMI/assets/audioImage/withYou.jpg"));

    addAudio("What Lovers Do",
             "Maroon 5",
             QUrl("HMI/assets/audio/What_Lovers_Do.mp3"),
             QUrl("HMI/assets/audioImage/whatLoversDo.jpg"));

    addAudio("Space Bound",
             "Eminem",
             QUrl("HMI/assets/audio/Space_Bound.mp3"),
             QUrl("HMI/assets/audioImage/spaceBound.jpg"));

    addAudio("Overdrive",
             "Post Malone",
             QUrl("HMI/assets/audio/Overdrive.mp3"),
             QUrl("HMI/assets/audioImage/overdrive.jpg"));

    addAudio("Dil Nu",
             "AP Dhillon",
             QUrl("HMI/assets/audio/Dil_Nu.mp3"),
             QUrl("HMI/assets/audioImage/dilNu.jpg"));

    addAudio("Cowboy In LA",
             "Lany",
             QUrl("HMI/assets/audio/cowboy_in_LA.mp3"),
             QUrl("HMI/assets/audioImage/cowboyInLA.jpg"));
}

bool PlayerController::playing() const
{
    return m_playing;
}

int PlayerController::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_audioList.length();
}

QVariant PlayerController::data(const QModelIndex &index, int role) const
{
    if (index.isValid() && index.row() >= 0 && index.row() < m_audioList.length()) {
        AudioInfo *audioInfo = m_audioList[index.row()];

        switch((Role) role) {
        case AudioTitleRole:
            return audioInfo->title();
        case AudioAuthorNameRole:
            return audioInfo->authorName();
        case AudioSourceRole:
            return audioInfo->audioSource();
        case AudioImageSourceRole:
            return audioInfo->imageSource();
        }
    }

    return {};
}

QHash<int, QByteArray> PlayerController::roleNames() const
{
    QHash<int, QByteArray> result;

    result[AudioAuthorNameRole] = "audioAuthorName";
    result[AudioTitleRole] = "audioTitle";
    result[AudioSourceRole] = "audioSource";
    result[AudioImageSourceRole] = "audioImageSource";

    return result;
}

void PlayerController::switchToNextSong()
{
    const int index = m_audioList.indexOf(m_currentSong);

    if (index+1 >= m_audioList.length()) {
        setCurrentSong(m_audioList.first());
    } else {
        setCurrentSong(m_audioList[index+1]);
    }
}

void PlayerController::switchToPreviousSong()
{
    const int index = m_audioList.indexOf(m_currentSong);

    if (index-1 < 0) {
        setCurrentSong(m_audioList.last());
    } else {
        setCurrentSong(m_audioList[index-1]);
    }
}

void PlayerController::playPause()
{
    m_playing = !m_playing;
    emit playingChanged();

    if (m_playing) {
        m_mediaPlayer.play();
    } else {
        m_mediaPlayer.pause();
    }
}

void PlayerController::changeAudioSource(const QUrl &source)
{
    m_mediaPlayer.stop();
    m_mediaPlayer.setSource(source);

    if (m_playing) {
        m_mediaPlayer.play();
    }
}

void PlayerController::addAudio(const QString &title, const QString &authorName, const QUrl &audioSource, const QUrl &imageSource)
{
    beginInsertRows(QModelIndex(), m_audioList.length(), m_audioList.length());

    AudioInfo *audioInfo = new AudioInfo(this);

    audioInfo->setTitle(title);
    audioInfo->setAuthorName(authorName);
    audioInfo->setAudioSource(audioSource);
    audioInfo->setImageSource(imageSource);

    if (m_audioList.isEmpty()) {
        setCurrentSong(audioInfo);
    }

    m_audioList << audioInfo;

    endInsertRows();
}

void PlayerController::removeAudio(int index)
{
    if (index >= 0 && index < m_audioList.length()) {
        beginRemoveRows(QModelIndex(), index, index);

        AudioInfo *toRemove = m_audioList[index];

        if (toRemove == m_currentSong) {
            if (m_audioList.length() > 1) {
                if (index != 0) {
                    setCurrentSong(m_audioList[index - 1]);
                } else {
                    setCurrentSong(m_audioList[index + 1]);
                }
            } else {
                setCurrentSong(nullptr);
            }
        }

        m_audioList.removeAt(index);
        toRemove->deleteLater();

        endRemoveRows();
    }
}

void PlayerController::switchToAudioByIndex(int index)
{
    if (index >= 0 && index < m_audioList.length()) {
        setCurrentSong(m_audioList[index]);
    }
}

AudioInfo *PlayerController::currentSong() const
{
    return m_currentSong;
}

void PlayerController::setCurrentSong(AudioInfo *newCurrentSong)
{
    if (m_currentSong == newCurrentSong)
        return;
    m_currentSong = newCurrentSong;
    emit currentSongChanged();

    if (m_currentSong) {
        changeAudioSource(m_currentSong->audioSource());
    } else {
        m_mediaPlayer.stop();
        m_mediaPlayer.setSource(QUrl());
        m_playing = false;
        emit playingChanged();
    }
}
