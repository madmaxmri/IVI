import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    ListView {
        id: listView
        anchors.fill: parent
        spacing: 4
        clip: true

        model: contactModel

        delegate: ColumnLayout {
            width: parent.width
            spacing: 4

            RowLayout{
                width: parent.width
                spacing: 4
                Layout.leftMargin: 4

                Rectangle {
                    width: 50
                    height: 50
                    radius: 25
                    color: "#3F3F42"

                    Text {
                        anchors.centerIn: parent
                        font.pixelSize: 12
                        color: "#FFFFFF"
                        text: model.name[0].toUpperCase()
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 4
                    Text {
                        id: person
                        font.pixelSize: 12
                        color: "#FFFFFF"
                        Layout.leftMargin: 10
                        text: model.name
                    }

                    Text {
                        id:  cnumber
                        font.pixelSize: 10
                        color: "#FFFFFF"
                        Layout.leftMargin: 10
                        text: model.number
                    }
                }
            }
            Rectangle {
                id: divider
                Layout.fillWidth: true
                height: 1
                opacity: 0.2
                color: "#FFFFFF"
            }
        }

        ScrollBar.vertical: ScrollBar {

        }

    }
}
