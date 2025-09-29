import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../SettingsComponent"
import "../Buttons"

MainPage {
    id: root
    anchors.fill: parent
    RowLayout {
        id: mainRow
        width: root.width
        spacing: 20
        anchors.left: parent.left
        anchors.leftMargin: 60

        Pane {
            id: text
            Layout.fillWidth: true
            Layout.fillHeight: true
            padding: 0

            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
            }

            ColumnLayout {
                width: parent.width
                spacing: 30

                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    Layout.topMargin: 20
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    color: "#FFFFFF"
                    text: qsTr("Bluetooth")
                }

                SwitchDelegate {
                    Layout.preferredWidth: parent.width * 0.4
                    spacing: 20

                    background: Rectangle {
                        anchors.fill: parent
                        color: "#00B1B2"
                        radius: 15
                    }

                    contentItem: Item {
                        width: parent.width
                        Layout.alignment: Qt.AlignVCenter
                        RowLayout {
                            PrefsButton {
                                setIcon: "../assets/icons/bluetooth-circle.png"
                            }

                            Text {
                                Layout.alignment: Qt.AlignLeft
                                font.pixelSize: 12
                                color: "#FFFFFF"
                                text: qsTr("Bluetooth")
                            }
                        }
                    }

                    indicator: PrefsSwitch {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                    }
                }

                ColumnLayout {
                    spacing: 5

                    Text {
                        Layout.alignment: Qt.AlignLeft
                        font.pixelSize: 16
                        color: "#50FFFFFF"
                        text: qsTr(
                                  "Now discoverable as \"Jeep Grand Cherokee\"")
                    }

                    Item {
                        Layout.preferredHeight: 10
                        Layout.fillWidth: true
                    }

                    Text {
                        Layout.alignment: Qt.AlignLeft
                        font.pixelSize: 16
                        color: "#50FFFFFF"
                        text: qsTr("Turn on Bluetooth to connect with this device")
                    }
                }
            }
        }

    }
    Image {
        id: car
        anchors.top: parent.top
        anchors.topMargin: 60
        anchors.right: parent.right
        anchors.rightMargin: 40
        sourceSize: Qt.size(450,340)
        source: "../assets/backgrounds/car2.png"
    }
}
