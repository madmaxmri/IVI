import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Basic
import "../Buttons"

Rectangle {
    color: "#662b2323"
    Layout.preferredWidth: 380
    Layout.preferredHeight: 262.5
    radius: 15

    ColumnLayout {
        spacing: 5
        anchors {
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }

        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: qsTr("Notifications")
            font.pixelSize: 14
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#50FFFFFF"
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            spacing: 2

            RowLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                spacing: 180
                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    text: qsTr("Battery Low Alert")
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    font.family: "Lato"
                    color: "#CB2020"
                }
                PrefsButton {
                    iconColor: "#CB2020"
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    setIcon: "../assets/icons/battery-exclamation.png"
                }
            }

            Text {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                text: qsTr("Charging Required")
                font.pixelSize: 12
                font.weight: Font.Light
                font.family: "Lato"
                color: "#FFFFFF"
            }

            RowLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                spacing: 170
                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    text: qsTr("Brake System Alert")
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    font.family: "Lato"
                    color: "#CB2020"
                }
                PrefsButton {
                    iconColor: "#CB2020"
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    setIcon: "../assets/icons/brake-warning.png"
                }

            }

            RowLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                spacing: 168
                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    text: qsTr("Check Tire Pressure")
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    font.family: "Lato"
                    color: "#FFB800"
                }

                PrefsButton {
                    iconColor: "#FFB800"
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    setIcon: "../assets/icons/tire-pressure-warning.png"
                }
            }

            Text {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                text: qsTr("Maintenance Required")
                font.pixelSize: 12
                font.weight: Font.Light
                font.family: "Lato"
                color: "#FFFFFF"
            }
        }

        Item {
            Layout.preferredHeight: 5
        }

        Rectangle {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            width: 340
            height: 2
            color: "#6a6363"
            radius: 5
        }

        Item {
            Layout.preferredHeight: 5
        }

        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: qsTr("No incoming calls")
            font.pixelSize: 14
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#FFFFFF"
        }
    }

}
