import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../Buttons"
import "../AudioComponent"
import AudioSearchModel
import PlayerController

Rectangle {
    id: root

    color: "#662b2323"
    Layout.preferredWidth: 380
    Layout.preferredHeight: 545
    radius: 15

    Rectangle {
        id: mainSection

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: bottomBar.top
        }

        color: "transparent"

        AudioInfoBox {
            id: songInfo

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }
        }
    }

    Rectangle {
        id: bottomBar

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        height: mainSection.height / 2.8
        color: "#501e1e1e"
        radius: 15

        Row {
            anchors.centerIn: parent
            spacing: 20
            enabled: !!PlayerController.currentSong
            opacity: enabled ? 1 : 0.3

            ImageButton {
                id: previousButton

                anchors {
                    verticalCenter: parent.verticalCenter
                }

                width: 40
                height: 40

                source: "../assets/icons/previous.png"

                onClicked: {
                    PlayerController.switchToPreviousSong()
                }
            }

            ImageButton {
                id: playPauseButton

                width: 60
                height: 60

                source: PlayerController.playing ? "../assets/icons/pause.png" : "../assets/icons/play.png"

                onClicked: {
                    PlayerController.playPause()
                }
            }

            ImageButton {
                id: nextButton

                anchors {
                    verticalCenter: parent.verticalCenter
                }

                width: 40
                height: 40

                source: "../assets/icons/next.png"

                onClicked: {
                    PlayerController.switchToNextSong()
                }
            }
        }
    }


}
