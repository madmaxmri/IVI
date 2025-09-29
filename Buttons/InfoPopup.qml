import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {
    id: info
    property color infoColor: "#CB2020"
    property string icon: "../assets/icons/battery-exclamation.png"
    property string title: qsTr("Battery Low Alert")
    property string subtitle: qsTr("Charging Required")
    padding: 0
    width: 918
    height: 100
    background: Rectangle{
        anchors.fill: parent
        color: "#50FFFFFF"
        radius: 15

        Rectangle{
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            height: 100
            width: 10
            radius: 10
            color: info.infoColor
        }
    }

    Item{
        anchors.fill: parent
        Rectangle{
            id: notifIcon
            width: 70
            height: width
            radius: height/2
            color: info.infoColor

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 33.5

            Image {
                anchors.centerIn: parent
                source: info.icon
                sourceSize: Qt.size(notifIcon.width * 0.6, notifIcon.width * 0.6)
            }
        }

        Column {
            width: info.width * 0.8
            spacing: 10
            anchors.left: notifIcon.right
            anchors.leftMargin: 23.5
            anchors.top: parent.top
            anchors.topMargin: 20

            Text {
                Layout.alignment: Qt.AlignVCenter
                text: info.title
                color: "#FFFFFF"
                font.pixelSize: 20
            }
            Text {
                Layout.alignment: Qt.AlignVCenter
                font.pixelSize: 12
                text: info.subtitle
                wrapMode: Text.WordWrap
                width: parent.width
                color: "#FFFFFF"
            }
        }

    }

}
