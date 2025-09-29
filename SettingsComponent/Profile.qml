import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../SettingsComponent"
import "../Buttons"

MainPage {
    id: root
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 20
        spacing: 10

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            spacing: 10

            Item {
                Layout.preferredWidth: 340
            }

            Image {
                source: "../assets/icons/jeep.png"
                fillMode: Image.PreserveAspectFit
                Layout.preferredWidth: 120
                Layout.preferredHeight: 60
            }

            Text {
                font.pixelSize: 16
                text: qsTr("Mickal")
                color: "#FFFFFF"
            }
        }

        Image {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft
            source: "../assets/icons/HorizontalSeparator.png"
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            spacing: 50

            RowLayout {
                spacing: 20
                Layout.fillWidth: true

                Item {
                    Layout.preferredWidth: 120
                }

                Text {
                    text: qsTr("Model Number")
                    font.pixelSize: 14
                    color: "#50FFFFFF"
                }
                Text {
                    text: qsTr("WK27001")
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    color: "#FFFFFF"
                }

                Image {
                    source: "../assets/icons/smallSeparator.png"
                    Layout.preferredWidth: 20
                    Layout.preferredHeight: 20
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    text: qsTr("Registration Number")
                    font.pixelSize: 14
                    color: "#50FFFFFF"
                }
                Text {
                    text: qsTr("AK35 1257")
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    color: "#FFFFFF"
                }

                Image {
                    source: "../assets/icons/smallSeparator.png"
                    Layout.preferredWidth: 20
                    Layout.preferredHeight: 20
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    text: qsTr("Vin Number")
                    font.pixelSize: 14
                    color: "#50FFFFFF"
                }
                Text {
                    text: qsTr("2365GH7685")
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    color: "#FFFFFF"
                }
            }
        }

        Image {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft
            source: "../assets/icons/HorizontalSeparator.png"
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 20
            spacing: 50

            Item {
                Layout.preferredWidth: 360
            }

            Text {
                font.weight: Font.Bold
                font.pixelSize: 16
                color: "#FFFFFF"
                text: qsTr("Documents")
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 50

            Item {
                Layout.preferredWidth: 100
            }

            RowLayout {
                spacing: 40

                ColumnLayout {
                    spacing: 0
                    Image {
                        source: "../assets/icons/driving.png"
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 200
                        fillMode: Image.PreserveAspectFit
                    }
                    Text {
                        font.pixelSize: 14
                        color: "#FFFFFF"
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Driving License")
                    }
                }

                ColumnLayout {
                    spacing: 0
                    Image {
                        source: "../assets/icons/pencard.png"
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 200
                        fillMode: Image.PreserveAspectFit
                    }
                    Text {
                        font.pixelSize: 14
                        color: "#FFFFFF"
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Pan Card")
                    }
                }

                ColumnLayout {
                    spacing: 0
                    Image {
                        source: "../assets/icons/Adhaar.png"
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 200
                        fillMode: Image.PreserveAspectFit
                    }
                    Text {
                        font.pixelSize: 14
                        color: "#FFFFFF"
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Adhaar Card")
                    }
                }
            }
        }
    }
}
