import QtQuick 2.15
import QtQuick.VirtualKeyboard
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../Buttons"

Rectangle {
    id: root
    Layout.preferredWidth: 600
    Layout.preferredHeight: heightOfTile
    property int heightOfTile: inputPanel.active ? 170 : 170
    property bool activePannel: inputPanel.active

    color: inputPanel.active ? "#00000000" : "#662b2323"
    radius: 15

    RowLayout {
        visible: !inputPanel.active
        anchors.fill: parent
        anchors.margins: 10

        Item {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                spacing: 0

                Item {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Recents")
                        font.pixelSize: 14
                        font.weight: Font.Bold
                        font.family: "Lato"
                        color: "#50FFFFFF"
                    }
                }

                Item {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.bottomMargin: 20
                    clip: true

                    ListView {

                        width: parent.width
                        height: parent.height
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.top: parent.top

                        model: 10
                        spacing: 5
                        clip: true

                        delegate: ItemDelegate {
                            width: 400
                            height: 55
                            anchors.left: ListView.left
                            background: null
                            contentItem: Item {
                                anchors.fill: parent
                                anchors.leftMargin: 10
                                anchors.topMargin: 5
                                anchors.bottomMargin: 5

                                ColumnLayout {
                                    anchors.left: parent.left
                                    anchors.verticalCenter: parent.verticalCenter
                                    Text {
                                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                        text: qsTr("Sector 2, HSR Layout")
                                        font.pixelSize: 14
                                        font.weight: Font.Bold
                                        font.family: "Lato"
                                        color: "#FFFFFF"
                                    }
                                    Text {
                                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                        text: qsTr("27th Main Rd, Bengaluru, Karnataka 560102")
                                        font.pixelSize: 14
                                        font.family: "Lato"
                                        color: "#50FFFFFF"
                                    }
                                }

                                Rectangle {
                                    anchors.bottom: parent.bottom
                                    anchors.left: parent.left
                                    height: 1
                                    width: parent.width
                                    color: "#6a6363"
                                }
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.preferredWidth: 1
            Layout.preferredHeight: parent.height * 0.9
            color: "#6a6363"
        }

        Item {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.preferredWidth: 100

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                anchors.fill: parent
                spacing: 0

                Item {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: 50
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Favorites")
                        font.pixelSize: 14
                        font.weight: Font.Bold
                        font.family: "Lato"
                        color: "#50FFFFFF"
                    }
                }

                Item {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.bottomMargin: 20
                    clip: true

                    ListView {
                        width: parent.width
                        height: parent.height
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top

                        model: ListModel {
                            ListElement { addIcon: "../assets/icons/home.png" }
                            ListElement { addIcon: "../assets/icons/briefcase.png" }
                            ListElement { addIcon: "../assets/icons/plus.png" }
                        }

                        spacing: 10
                        clip: true

                        delegate: PrefsButton {
                            radius: 8
                            setIcon: addIcon
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }
        }
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: heightOfTile * 2
        width: 600

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: heightOfTile - inputPanel.height
            }
        }

        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
