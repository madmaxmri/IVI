import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts 1.15
import "../CallComponent"

Rectangle {
    id: root
    Layout.preferredWidth: 980
    Layout.preferredHeight: 545
    color: "#662b2323"
    radius: 15

    property int index: StackView.index
    onIndexChanged: index > 0 ? drawer.open() : drawer.close()

    property alias fontName: fontLoader.name

    FontLoader {
        id: fontLoader
        source: "../assets/font/fontawesome.otf"
    }

    Text {
        id: dialbtn
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        anchors.right: parent.right
        anchors.rightMargin: 4
        font.family: fontName
        color: "#FFFFFF"
        font.pixelSize: 12
        z: 1
        text: "\uf13a"
        MouseArea {
            anchors.fill: parent
            onClicked: drawer.open()
        }
    }


    Item {
        id: phonetab
        width: parent.width
        height: 48
        property int currentIndex: 0   // 0 = Call History, 1 = Contacts

        Rectangle {
            anchors.fill: parent
            color: "#444"
        }

        RowLayout {
            id: tabRow
            anchors.fill: parent
            anchors.margins: 6
            spacing: 8

            // Tab: Call History
            Rectangle {
                Layout.preferredWidth: phonetab.width * 0.5 - 12
                Layout.fillHeight: true
                radius: 10
                color: phonetab.currentIndex === 0 ? "#00B1B2" : "transparent"
                border.color: phonetab.currentIndex === 0 ? "transparent" : "#555"
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 6
                    Text {
                        id: tabCallHistoryText
                        text: "Call History"
                        font.pixelSize: 14
                        Layout.alignment: Qt.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        color: phonetab.currentIndex === 0 ? "#FFFFFF" : "#EAEAEA"
                    }

                    Item { Layout.fillWidth: true }
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: phonetab.currentIndex = 0
                }
            }

            Rectangle {
                Layout.preferredWidth: phonetab.width * 0.5 - 12
                Layout.fillHeight: true
                radius: 10
                color: phonetab.currentIndex === 1 ? "#00B1B2" : "transparent"
                border.color: phonetab.currentIndex === 1 ? "transparent" : "#555"
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 6
                    Text {
                        id: tabContactsText
                        text: "Contacts"
                        font.pixelSize: 14
                        Layout.alignment: Qt.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        color: phonetab.currentIndex === 1 ? "#FFFFFF" : "#EAEAEA"
                    }
                    Item { Layout.fillWidth: true }
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: phonetab.currentIndex = 1
                }
            }
        }
    }


    StackLayout {
        id: contentStack
        width: parent.width
        height: parent.height
        currentIndex: phonetab.currentIndex
        anchors.top: phonetab.bottom
        anchors.topMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4

        CallHistory { id: historyTab }
        Contacts    { id: contactsTab }
    }

    Drawer {
        id: drawer
        width: parent.width
        height: root.height * 0.6
        edge: Qt.BottomEdge
        background: Rectangle { color: "#3F3F42" }

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            // Dial screen
            TextField {
                id: dialscreen
                Layout.preferredWidth: drawer.width
                Layout.preferredHeight: drawer.height * 0.2
                font.pixelSize: 20
                horizontalAlignment: TextInput.AlignHCenter
                readOnly: true
                color: "#FFFFFF"
                background: Item {}
                Text {
                    anchors.right: dialscreen.right
                    anchors.rightMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: fontName
                    color: "#FFFFFF"
                    font.pixelSize: 20
                    text: "\u232b"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: if (dialscreen.length > 0) dialscreen.remove(dialscreen.length - 1, dialscreen.length)
                    }
                }
            }

            // Divider
            Rectangle {
                Layout.fillWidth: true
                height: 1
                opacity: 0.2
                color: "#FFFFFF"
            }

            // Dial pad
            GridLayout {
                id: dialpad
                columns: 3
                Layout.preferredWidth: drawer.width
                Layout.preferredHeight: drawer.height * 0.6
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.margins: 10
                rowSpacing: 5
                columnSpacing: 5
                Repeater {
                    model: ["1","2","3","4","5","6","7","8","9","*","0","#"]
                    Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: "black"
                        radius: 10
                        Text {
                            anchors.centerIn: parent
                            font.pixelSize: 24
                            color: "#FFFFFF"
                            text: modelData
                        }
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: dialscreen.insert(dialscreen.length, modelData)
                        }
                    }
                }
            }

            // Call button
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: drawer.height * 0.2
                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width * 0.2
                    height: parent.height * 0.6
                    radius: 10
                    color: "#1DAB7E"
                    Text {
                        anchors.centerIn: parent
                        font.pixelSize: 20
                        font.family: fontName
                        color: "#FFFFFF"
                        text: "\uf095"
                    }
                }
            }
        }
    }
}
