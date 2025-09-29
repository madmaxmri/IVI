import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../SettingsComponent"
import "../Buttons"

MainPage {
    id: root
    anchors.fill: parent

    ColumnLayout {
        width: parent.width
        spacing: 10

        RowLayout {
            width: parent.width
            spacing: 5

            Text {
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.leftMargin: 60
                Layout.topMargin: 20
                font.pixelSize: 20
                font.weight: Font.Bold
                color: "#FFFFFF"
                text: qsTr("Update")
            }

            Item {
                Layout.preferredWidth: 620
            }

            PrefsButton {
                Layout.topMargin: 20
                implicitWidth: 200
                setText: qsTr("Check For Update")
                iconColor: "#FFFFFF"
                background: Rectangle {
                    color: "#00B1B2"
                    radius: 15
                }
            }
        }

        ColumnLayout {
            width: root.width
            spacing: 20

            Item {
                Layout.fillWidth: true
            }

            Image {
                Layout.alignment: Qt.AlignLeft
                sourceSize: Qt.size(1015,2)
                source: "../assets/icons/HorizontalSeparator.png"
            }

            Rectangle {
                Layout.alignment: Qt.AlignLeft
                Layout.leftMargin: 60
                width: parent.width * 0.9
                height: 100
                radius: 15
                color: "#50FFFFFF"

                Rectangle {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height
                    width: 10
                    radius: 10
                    color: "#00B1B2"
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    text: qsTr("Software")
                    color: "#FFFFFF"
                }

                ColumnLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        font.pixelSize: 10
                        font.weight: Font.Bold
                        text: qsTr("Update Available 5.15.11")
                        color: "#00B1B2"
                    }

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        font.pixelSize: 10
                        font.weight: Font.Normal
                        text: qsTr("<a href='https://www.example.com'>Release Notes</a>")
                        textFormat: Text.RichText
                        color: "light blue"
                    }
                }

                PrefsButton {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    implicitWidth: 150
                    setText: qsTr("Update")
                    iconColor: "#FFFFFF"
                    background: Rectangle {
                        color: "#00B1B2"
                        radius: 15
                    }
                }
            }
        }
    }
}
