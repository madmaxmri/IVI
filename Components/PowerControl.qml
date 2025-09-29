import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Basic
import "../Buttons"

Rectangle {
    id: root
    color: "#662b2323"
    Layout.preferredWidth: 380
    Layout.preferredHeight: 262.5
    radius: 15

    signal modeChanged(int index)
    signal powerOff

    ColumnLayout {
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
        Text {
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.leftMargin: 20
            Layout.bottomMargin: 30
            text: qsTr("Power Control")
            font.pixelSize: 14
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#50FFFFFF"
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20
            PrefsButton {
                Layout.leftMargin: 20
                setIcon: "../assets/icons/homeScreenIcons/angle-left.png"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: {
                    if (swipeView.currentIndex !== 0) {
                        swipeView.currentIndex = swipeView.currentIndex - 1
                    }
                }
            }

            SwipeView {
                id: swipeView
                clip: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                currentIndex: 0
                Layout.preferredWidth: root.width * 0.6
                Layout.preferredHeight: 50
                onCurrentIndexChanged: {
                    root.modeChanged(currentIndex)
                }

                Item {
                    clip: true
                    RowLayout {
                        anchors.centerIn: parent
                        spacing: 10
                        Text {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignCCenter
                            clip: true
                            text: qsTr("ECO Mode")
                            font.pixelSize: 20
                            font.weight: Font.Bold
                            font.family: "Lato"
                            color: "#5CD44A"
                        }

                        Image {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            sourceSize: Qt.size(20, 20)
                            source: "../assets/icons/homeScreenIcons/bio-leaves.png"
                        }
                    }
                }

                Item {
                    clip: true
                    RowLayout {
                        anchors.centerIn: parent
                        spacing: 10

                        Text {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            clip: true
                            text: qsTr("Sport Mode")
                            font.pointSize: 18
                            font.weight: Font.Bold
                            font.family: "Lato"
                            color: "#33acff"
                        }

                        Image {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            sourceSize: Qt.size(20, 20)
                            source: "../assets/icons/homeScreenIcons/motorcycle-helmet.png"
                        }
                    }
                }

                Item {
                    clip: true
                    Text {
                        clip: true
                        anchors.centerIn: parent
                        text: qsTr("Normal")
                        font.pixelSize: 20
                        font.weight: Font.Bold
                        font.family: "Lato"
                        color: "#FFFFFF"
                    }
                }
            }

            PrefsButton {
                Layout.rightMargin: 20
                setIcon: "../assets/icons/homeScreenIcons/angle-right.png"
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                onClicked: {
                    if (swipeView.currentIndex !== 2) {
                        swipeView.currentIndex = swipeView.currentIndex + 1
                    }
                }
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.preferredWidth: root.width * 0.7
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: {
                if (swipeView.currentIndex === 0) {
                    return qsTr("ECO Mode saves on battery consumption as you drive.")
                } else if (swipeView.currentIndex === 1) {
                    return qsTr("Sport Mode gives you a more engaging drive, but uses up more battery.")
                }
                return qsTr("Normal Mode gives you a balance between performance & battery life.")
            }
            font.pixelSize: 14
            font.family: "Lato"
            horizontalAlignment: Text.AlignHCenter
            color: "#FFFFFF"
        }

        Rectangle {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            width: 300
            height: 2
            color: "#6a6363"
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 10
            Text {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("Vehicle Power Off")
                font.pixelSize: 20
                font.weight: Font.Bold
                font.family: "Lato"
                color: "#CB2020"
                MouseArea {
                    anchors.fill: parent
                    onClicked: root.powerOff()
                }
            }

            PrefsButton {
                iconColor: "#CB2020"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                setIcon: "../assets/icons/homeScreenIcons/power.png"
                onClicked: root.powerOff()
            }
        }
    }
}
