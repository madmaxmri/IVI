import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 1.15
import "../Buttons"
import "../SettingsComponent"

MainPage {
    id: root
    anchors.fill: parent

    ColumnLayout {
        width: parent.width
        spacing: 20

        SwitchDelegate {
            Layout.preferredWidth: parent.width * 0.9
            Layout.leftMargin: 60
            spacing: 20

            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
                radius: 15
            }

            contentItem: Text {
                text: qsTr("Blind Spot Detection")
                font.weight: Font.Bold
                font.pixelSize: 20
                color: "#FFFFFF"
            }

            indicator: PrefsSwitch {
                checked: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
            }
        }

        Image {
            Layout.preferredWidth: parent.width
            source: "../assets/icons/HorizontalSeparator.png"
        }

        ColumnLayout {
            Layout.preferredWidth: parent.width * 0.9
            Layout.alignment: Qt.AlignHCenter
            spacing: 20

            Text {
                text: qsTr("Displays Blind Spot views in the Cluster when changing lanes and using the turn signal")
                font.pixelSize: 14
                color: "#FFFFFF"
                wrapMode: Text.WordWrap
                Layout.alignment: Qt.AlignHCenter
            }

            Image {
                Layout.preferredWidth: 440
                Layout.preferredHeight: 260
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: 0.5
                source: "../assets/icons/emergency_break.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Component.onCompleted: {
        console.log("Emergency break component loaded")
    }
}
