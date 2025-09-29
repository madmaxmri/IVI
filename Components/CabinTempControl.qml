import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import "../Buttons"

Rectangle {
    property bool celsius: true
    color: "#662b2323"
    Layout.preferredWidth: 270
    Layout.preferredHeight: 262.5
    radius: 15

    function fahrenheitToCelsius(fahrenheit) {
        return ((fahrenheit - 32) * 5 / 9).toFixed(2)
    }

    ColumnLayout {
        width: parent.width * 0.8
        anchors.centerIn: parent
        spacing: 20
        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.bottomMargin: 20
            text: qsTr("Cabin Temperature")
            font.pixelSize: 14
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#50FFFFFF"
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 10
            Text {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("Temperature")
                font.pixelSize: 14
                font.weight: Font.Light
                font.family: "Lato"
                color: "#FFFFFF"
            }
            Text {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("%0 °%1").arg(
                          !celsius ? 72 : fahrenheitToCelsius(72)).arg(
                          celsius ? "C" : "F")
                font.pixelSize: 20
                font.weight: Font.Bold
                font.family: "Lato"
                color: "#FFFFFF"
            }
            RowLayout {
                spacing: 10
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Text {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    text: qsTr("H: %0 °%1").arg(
                              !celsius ? 75 : fahrenheitToCelsius(75)).arg(
                              celsius ? "C" : "F")
                    font.pixelSize: 12
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    text: qsTr("L: %0 °%1").arg(
                              !celsius ? 64 : fahrenheitToCelsius(64)).arg(
                              celsius ? "C" : "F")
                    font.pixelSize: 12
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }
            }
        }

        Item {
            Layout.preferredHeight: 1
        }

        RowLayout {
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Item {
                Layout.fillWidth: true
            }
            ColumnLayout {
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                PrefsButton {
                    id: feButton
                    setText: qsTr("°F")
                    checked: !celsius
                    checkable: true
                    implicitHeight: 20
                    implicitWidth: 30
                    font.pixelSize: 24
                    font.weight: checked ? Font.Bold : Font.Light
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: {
                        celsius = false
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    width: 30
                    height: 2
                    radius: 5
                    color: feButton.checked ? "#FFFFFF" : "#00000000"
                }
            }

            Rectangle {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                width: 2
                height: 20
                color: "#252525"
                radius: 5
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                PrefsButton {
                    id: cenButton
                    implicitHeight: 20
                    implicitWidth: 30
                    checked: celsius
                    setText: qsTr("°C")
                    font.pixelSize: 24
                    font.weight: checked ? Font.Bold : Font.Light
                    checkable: true
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: {
                        celsius = true
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    width: 30
                    height: 2
                    radius: 5
                    color: cenButton.checked ? "#FFFFFF" : "#00000000"
                }
            }
        }
    }
}
