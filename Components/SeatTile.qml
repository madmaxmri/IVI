import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Basic
import "../Buttons"

Rectangle {
    id: root
    property string title: qsTr("Driver's Seat")
    property real temperature: 70
    property bool heatSeatChecked: false
    property bool fanSeatChecked: false
    property bool celsius: true

    color: "#662b2323"
    Layout.preferredWidth: 270
    Layout.preferredHeight: 262.5
    radius: 15

    function fahrenheitToCelsius(fahrenheit) {
        return ((fahrenheit - 32) * 5 / 9).toFixed(2)
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 30

        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.bottomMargin: 20
            text: root.title
            Layout.leftMargin: 20
            font.pixelSize: 14
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#50FFFFFF"
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20

            PrefsButton {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                setIcon: "../assets/icons/homeScreenIcons/angle-left.png"
                onClicked: {
                    temperature = temperature - 1
                }
            }

            Item {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredWidth: root.width * 0.5
                Text {
                    anchors.centerIn: parent
                    text: qsTr("%0 %1").arg(
                              celsius ? fahrenheitToCelsius(
                                            temperature) : temperature).arg(
                              celsius ? "°C" : "°F")
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: "Lato"
                    color: "#FFFFFF"
                }
            }

            PrefsButton {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                setIcon: "../assets/icons/homeScreenIcons/angle-right.png"
                onClicked: {
                    temperature = temperature + 1
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 50
            ColumnLayout {
                spacing: 5
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Text {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    text: qsTr("Air Flow")
                    font.pixelSize: 12
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }

                Item {
                    Layout.preferredHeight: 5
                }

                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        PrefsButton {
                            id: fanIcon
                            checkable: true
                            checked: root.fanSeatChecked
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            setIcon: "../assets/icons/fan.png"
                            iconColor: checked ? "#FFFFFF" : "#808080"
                        }

                        Text {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            text: fanIcon.checked ? qsTr("ON") : qsTr("OFF")
                            font.pixelSize: 12
                            font.weight: Font.Light
                            font.family: "Lato"
                            color: fanIcon.checked ? "#FFFFFF" : "#808080"
                        }
                    }

                    Rectangle {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        width: 63
                        height: 2
                        color: fanIcon.checked ? "#FFFFFF" : "#808080"
                        radius: 5
                    }
                }
            }

            ColumnLayout {
                spacing: 5
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Text {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    text: qsTr("Heated Seat")
                    font.pixelSize: 12
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }

                Item {
                    Layout.preferredHeight: 5
                }

                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        PrefsButton {
                            id: heatSeatIcon
                            checkable: true
                            checked: root.heatSeatChecked
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            setIcon: "../assets/icons/heatSeat.png"
                            iconColor: checked ? "#FFFFFF" : "#808080"
                        }

                        Text {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            text: heatSeatIcon.checked ? qsTr(
                                                             "ON") : qsTr("OFF")
                            font.pixelSize: 12
                            font.weight: Font.Light
                            font.family: "Lato"
                            color: heatSeatIcon.checked ? "#FFFFFF" : "#808080"
                        }
                    }
                    Rectangle {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        width: 63
                        height: 2
                        color: heatSeatIcon.checked ? "#FFFFFF" : "#00000000"
                        radius: 5
                    }
                }
            }
        }

    }
}
