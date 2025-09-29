import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import "../SettingsComponent"
import "../Buttons"

MainPage {
    id: root
    anchors.fill: parent

    ColumnLayout {
        id: layout
        anchors.left: parent.left
        anchors.leftMargin: 60
        width: root.width
        spacing: 20


        RowLayout {
            Layout.alignment: Qt.AlignTop
            Layout.topMargin: 20
            Text {
                font.pixelSize: 20
                font.weight: Font.Bold
                color: "#FFFFFF"
                text: qsTr("Notification")
                Layout.alignment: Qt.AlignLeft
            }
        }
    }

    Image {
        id: div
        width: root.width
        anchors.top: layout.bottom
        anchors.topMargin: 40
        source: "../assets/icons/HorizontalSeparator.png"
    }

    ColumnLayout {
        id: layout2
        anchors.top: div.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 60
        width: root.width
        spacing: 20

        InfoPopup {
            infoColor: "#CB2020"
            icon: "../assets/icons/battery-exclamation.png"
            title: qsTr("Battery Low Alert")
            subtitle: qsTr("Charging Required")
        }

        InfoPopup {
            infoColor: "#CB2020"
            icon: "../assets/icons/brake-warning.png"
            title: qsTr("Brake System Alert")
            subtitle: qsTr("Maintenance Required")
        }

        InfoPopup {
            infoColor: "#FFB800"
            icon: "../assets/icons/tire-pressure-warning.png"
            title: qsTr("Check Tire Pressure")
            subtitle: qsTr("Maintenance Required")
        }
    }
}
