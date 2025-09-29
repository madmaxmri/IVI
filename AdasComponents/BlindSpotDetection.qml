import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../Buttons"
import "../SettingsComponent"


MainPage {
    id: root
    anchors.fill: parent
    ColumnLayout {
        width: parent
        spacing: 20

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
                text: qsTr("Blind Spot Dectection")
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

        ColumnLayout {
            Layout.preferredWidth: parent.width * 0.75
            spacing: 20
            Text {
                Layout.alignment: Qt.AlignVCenter
                text: qsTr("Displays Blind Spot views in the Cluster when changing lanes and using the turn signal")
                font.pixelSize: 14
                color: "#FFFFFF"
            }

            Image {
                Layout.preferredWidth: parent.width
                Layout.alignment: Qt.AlignVCenter
                source: "../"
            }
        }
    }

}
