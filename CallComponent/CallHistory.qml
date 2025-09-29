import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    ListView {
        id: listView
        anchors.fill: parent
        spacing: 4

        model: historyModel

        delegate: ColumnLayout {
            width: parent.width
            spacing: 4
            RowLayout {
                width: parent.width
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 4
                    Text {
                        id: name
                        Layout.leftMargin: 4
                        font.pixelSize: 12
                        color: "#FFFFFF"
                        text: model.name
                    }

                    Text {
                        id: time
                        Layout.leftMargin: 4
                        font.pixelSize: 12
                        color: "#FFFFFF"
                        text: model.number + ", " + model.time
                    }
                }

                Text {
                    Layout.fillWidth: true
                }

                Text {
                    id: call
                    Layout.rightMargin: 4
                    font.pixelSize: 12
                    font.family: "Lato"
                    color: "#FFFFFF"
                    text: "\uf095"
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
