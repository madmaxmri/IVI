import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../SettingsComponent"
import "../Buttons"

MainPage {
    id: root
    width: 980
    anchors.left: parent.left
    anchors.leftMargin: 20

    ColumnLayout {
        width: root.width
        spacing: 20

        Item {}

        RowLayout {
            anchors.left: parent.left
            anchors.leftMargin: 60
            spacing: 5
            PrefsButton {
                setIcon: "../assets/icons/brightness-low.png"
            }
            Text {
                font.pixelSize: 20
                font.weight: Font.Bold
                color: "#FFFFFF"
                text: qsTr("Display brightness")
            }
        }

        Image {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft
            source: "../assets/icons/HorizontalSeparator.png"
        }

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 60
            font.pixelSize: 16
            color: "#FFFFFF"
            text: qsTr("Brightness Level")
        }

        PrefsSlider {
            anchors.left: parent.left
            anchors.leftMargin: 60
            value: 72
            Layout.preferredWidth: parent.width * 0.7
        }

        Image {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft
            source: "../assets/icons/HorizontalSeparator.png"
        }

        PrefsSwitch {
            anchors.left: parent.left
            anchors.leftMargin: 60
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.right
                anchors.leftMargin: 20
                font.pixelSize: 14
                color: "#FFFFFF"
                text: qsTr("Night Sight Headlight")
            }
        }
    }
}
