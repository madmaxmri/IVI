import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../SettingsComponent"
import "../Buttons"

MainPage {
    id: root
    anchors.fill: parent
    ColumnLayout {
        id: layout
        width: root.width
        spacing: 10

        SwitchDelegate {
            Layout.preferredWidth: parent.width * 0.9
            spacing: 20
            anchors.left: parent.left
            anchors.leftMargin: 60

            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
                radius: 15
            }

            contentItem: Text {
                text: qsTr("Turn indicator sounds")
                font.pixelSize: 20
                color: "#FFFFFF"
            }

            indicator: PrefsSwitch {
                checked: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
            }
        }

        Image {
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignLeft
            source: "../assets/icons/HorizontalSeparator.png"
        }


        SwitchDelegate {
            Layout.preferredWidth: parent.width * 0.9
            spacing: 20
            anchors.left: parent.left
            anchors.leftMargin: 60

            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
                radius: 15
            }

            contentItem: Text {
                text: qsTr("Parking Assist sound")
                font.pixelSize: 20
                color: "#FFFFFF"
                leftPadding: 5
            }

            indicator: PrefsSwitch {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
            }
        }

        Image {
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignLeft
            source: "../assets/icons/HorizontalSeparator.png"
        }
    }
}
