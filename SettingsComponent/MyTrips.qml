import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../SettingsComponent"
import "../Buttons"

MainPage {
    id: root
    width: 980
    anchors.fill: parent

    ColumnLayout {
        width: root.width
        spacing: 20

        Item {
        }

        RowLayout {
            anchors.left: parent.left
            anchors.leftMargin: 60
            spacing: 10
            Text {
                color: "#FFFFFF"
                font.weight: Font.Bold
                font.pixelSize: 20
                text: qsTr("Today")
                leftPadding: 5
            }

            PrefsButton {
                implicitWidth: 28
                implicitHeight: 28
                setIcon: "../assets/icons/caret-down.png"
            }
        }

        Image {
            width: parent.width
            Layout.alignment: Qt.AlignLeft
            source: "../assets/icons/HorizontalSeparator.png"
        }

        RowLayout {
            spacing: 30
            width: parent.width * 0.9
            anchors.left: parent.left
            anchors.leftMargin: 60

            RowLayout {
                spacing: 10
                PrefsButton {
                    implicitWidth: 36
                    implicitHeight: 36
                    setIcon: "../assets/icons/carIcon.png"
                }

                Text {
                    font.weight: Font.Bold
                    color: "#FFFFFF"
                    font.pixelSize: 16
                    text: qsTr("13 km 30 min")
                }
            }

            RowLayout {
                spacing: 10
                Layout.alignment: Qt.AlignLeft
                Layout.leftMargin: 60
                PrefsButton {
                    implicitWidth: 36
                    implicitHeight: 36
                    setIcon: "../assets/icons/marker.png"
                }

                Text {
                    font.pixelSize: 16
                    font.weight: Font.Bold
                    color: "#FFFFFF"
                    text: qsTr("2 Visit")
                }
            }
        }

        Image {
            width: parent.width
            Layout.alignment: Qt.AlignLeft
            source: "../assets/icons/HorizontalSeparator.png"
        }

        ListView {
            id: tripView
            width: parent.width
            height: contentHeight
            model: 2
            spacing: 20
            clip: true
            Layout.alignment: Qt.AlignLeft
            Layout.leftMargin: 60

            delegate: Rectangle {
                width: tripView.width * 0.9
                height: 160
                radius: 10
                color: "#50FFFFFF"
                clip: true

                Rectangle {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height
                    width: 10
                    radius: 10
                    color: "#00B1B2"
                }

                ColumnLayout {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    spacing: 20

                    Text {
                        Layout.fillWidth: true
                        Layout.leftMargin: 20
                        Layout.alignment: Qt.AlignLeft
                        font.pixelSize: 8
                        text: qsTr("Sunday , June 18 , 08:22 AM")
                    }

                    PrefsTimeLine {
                        id: time_line
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignLeft
                        mode: 0
                        model: ListModel {
                            ListElement {
                                label: "2025-07-01"
                                text: "HOME (26th Outlet, Near Showroom)"
                            }
                            ListElement {
                                label: "2025-09-01"
                                text: "HOME (26th Outlet, Near Showroom)"
                            }
                        }
                    }
                }
            }
        }
    }
}
