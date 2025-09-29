import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../SettingsComponent"
import "../Buttons"

MainPage {
    id: root
    anchors.fill: parent

    RowLayout {
        width: root.width
        anchors.left: parent.left
        anchors.leftMargin: 60
        anchors.top: parent.top
        anchors.topMargin: 60
        spacing: 20

        Image {
            id: car
            sourceSize: Qt.size(450,340)
            source: "../assets/backgrounds/car2.png"
        }

        Pane {
            Layout.fillWidth: true
            Layout.fillHeight: true
            padding: 0
            leftPadding: 60
            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
            }

            ColumnLayout {
                width: parent.width
                spacing: 30

                Text {
                    Layout.alignment: Qt.AlignLeft
                    font.pixelSize: 20
                    color: "#FFFFFF"
                    text: qsTr("Jeep Grand Cherokee")
                    font.family: "Lato"
                    font.weight: Font.Bold
                }

                Text {
                    Layout.alignment: Qt.AlignLeft
                    font.pixelSize: 16
                    color: "#FFFFFF"
                    text: qsTr("White")
                }

                RowLayout {
                    width: parent.width

                    ColumnLayout {
                        spacing: 30

                        ColumnLayout {
                            Text { text: qsTr("Range"); color: "#50FFFFFF"; font.pixelSize: 20 }
                            Text { text: qsTr("240"); color: "#FFFFFF"; font.pixelSize: 16 }
                        }

                        ColumnLayout {
                            Text { text: qsTr("Top Speed"); color: "#50FFFFFF"; font.pixelSize: 20 }
                            Text { text: qsTr("140 KMPH"); color: "#FFFFFF"; font.pixelSize: 16 }
                        }

                        ColumnLayout {
                            Text { text: qsTr("0 to 100% Charging"); color: "#50FFFFFF"; font.pixelSize: 20 }
                            Text { text: qsTr("4 Hrs"); color: "#FFFFFF"; font.pixelSize: 16 }
                        }
                    }

                    Item { Layout.fillWidth: true }

                    ColumnLayout {
                        spacing: 30

                        ColumnLayout {
                            Text { text: qsTr("Ride Modes"); color: "#50FFFFFF"; font.pixelSize: 20 }
                            Text { text: qsTr("Economy, Normal, Sports"); color: "#FFFFFF"; font.pixelSize: 16 }
                        }

                        ColumnLayout {
                            Text { text: qsTr("Acceleration"); color: "#50FFFFFF"; font.pixelSize: 20 }
                            Text { text: qsTr("3.8 Sec"); color: "#FFFFFF"; font.pixelSize: 16 }
                        }

                        ColumnLayout {
                            Text { text: qsTr("Max Power"); color: "#50FFFFFF"; font.pixelSize: 20 }
                            Text { text: qsTr("295 Hp"); color: "#FFFFFF"; font.pixelSize: 16 }
                        }
                    }

                    Item { Layout.preferredWidth: 200 }
                }
            }
        }
    }
}
