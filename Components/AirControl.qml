import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Basic
import "../Buttons"

Rectangle {
    id: root
    property bool acOn: false
    property bool airWindow: false
    property int fanSpeed: 12

    color: "#662b2323"
    Layout.preferredWidth: 270
    Layout.preferredHeight: 545

    radius: 15


    ColumnLayout {
        width: parent.width * 0.9
        anchors.centerIn: parent
        spacing: 25
        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.leftMargin: 10
            Layout.bottomMargin: 20
            text: qsTr("Air Control")
            font.pixelSize: 14
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#50FFFFFF"
        }

        Image {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            sourceSize: Qt.size(120,60)
            source: "../assets/icons/clean-car.png"
        }

        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("Air Outlet")
            font.pixelSize: 12
            font.weight: Font.Light
            font.family: "Lato"
            color: "#50FFFFFF"
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20
            PrefsButton {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                setIcon: "../assets/icons/airUp.png"
                checkable: true
                iconColor: checked ? "#FFFFFF" : "#808080"
            }
            PrefsButton {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                setIcon: "../assets/icons/airDown.png"
                checkable: true
                iconColor: checked ? "#FFFFFF" : "#808080"
            }
            PrefsButton {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                setIcon: "../assets/icons/airUpDown.png"
                checkable: true
                iconColor: checked ? "#FFFFFF" : "#808080"
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                PrefsButton {
                    id: airWindShield
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    setIcon: "../assets/icons/ventilation.png"
                    checkable: true
                    checked: !airWindow
                    iconColor: checked ? "#FFFFFF" : "#808080"
                    onClicked: {
                        airWindow = !airWindow
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    width: 40
                    height: 2
                    radius: 5
                    color: airWindShield.checked ? "#FFFFFF" : "#00000000"
                }
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                PrefsButton {
                    id: airBackWindow
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    setIcon: "../assets/icons/heater.png"
                    checkable: true
                    checked: airWindow
                    iconColor: checked ? "#FFFFFF" : "#808080"
                    onClicked: {
                        airWindow = !airWindow
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    width: 40
                    height: 2
                    radius: 5
                    color: airBackWindow.checked ? "#FFFFFF" : "#00000000"
                }
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            width: 220
            height: 1
            color: "#6a6363"
        }

        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: root.acOn ? qsTr("A/C ON") : qsTr("A/C OFF")

            font.pixelSize: 14
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#50FFFFFF"
        }

        Rectangle {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            width: 220
            height: 1
            color: "#6a6363"
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("Fan Speed")
            font.pixelSize: 12
            font.weight: Font.Light
            font.family: "Lato"
            color: "#50FFFFFF"
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20
            PrefsButton {
                setIcon: "../assets/icons/homeScreenIcons/angle-left.png"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                onClicked: {
                    if (fanSpeed !== 0) {
                        fanSpeed = fanSpeed - 1
                    }
                }
            }

            RowLayout {
                spacing: 20
                Image {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    sourceSize: Qt.size(20, 20)
                    source: Qt.resolvedUrl("../assets/icons/fan.png")
                }

                Text {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.preferredWidth: 50
                    text: qsTr("%0").arg(fanSpeed)
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: "Lato"
                    color: "#FFFFFF"
                }

                PrefsButton {
                    setIcon: "../assets/icons/homeScreenIcons/angle-right.png"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: {
                        if (fanSpeed !== 30) {
                            fanSpeed = fanSpeed + 1
                        }
                    }
                }
            }
        }

    }
}
