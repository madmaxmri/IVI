import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Basic
import "../Buttons"

Rectangle {
    id: root

    property real kiloMeter: 18
    property bool parkChecked: false
    property bool reverseChecked: false
    property bool neutralChecked: false
    property bool driveChecked: false

    property bool chargstnChecked: false

    color: "#662b2323"
    Layout.preferredHeight: 262.5
    Layout.preferredWidth: 430
    radius: 15

    function setDriveMode(mode) {
        parkChecked = (mode === "P")
        reverseChecked = (mode === "R")
        neutralChecked = (mode === "N")
        driveChecked = (mode === "D")
    }

    RowLayout {
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20

        ColumnLayout {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            spacing: 20

            Text {
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                Layout.bottomMargin: 40
                text: qsTr("Summary")
                font.pixelSize: 14
                font.weight: Font.Bold
                font.family: "Lato"
                color: "#50FFFFFF"
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                spacing: 2

                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    text: qsTr("%0 Km").arg(kiloMeter)
                    font.pixelSize: 12
                    font.weight: Font.Bold
                    font.family: "Lato"
                    color: "#FFFFFF"
                }

                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    text: qsTr("Journey Covered")
                    font.pixelSize: 10
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#50FFFFFF"
                }
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Image {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    sourceSize: Qt.size(20, 20)
                    source: "../assets/icons/circle-bolt.png"
                }
                PrefsButton {
                    id: stationButton
                    implicitHeight: 20
                    implicitWidth: 50
                    checked: chargstnChecked
                    setText: qsTr("Find Station")
                    font.pixelSize: 12
                    font.weight: checked ? Font.Bold : Font.Light
                    checkable: true
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    onClicked: {
                        chargstnChecked = true
                    }
                }
            }
        }

        Image {
            id: carImage
            sourceSize: Qt.size(220, 120)
            source: "../assets/backgrounds/car1.png"
        }


        Rectangle {
            Layout.preferredHeight: 165
            Layout.preferredWidth: 40
            radius: 40
            color: "#78252525"

            ColumnLayout {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                spacing: 2

                PrefsButton {
                    id: parkButton
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    checked: parkChecked
                    setIcon: "../assets/icons/parking-circle.png"
                    checkable: true
                    iconColor: checked ? "#FFFFFF" : "#808080"
                    onClicked: setDriveMode("P")
                }

                PrefsButton {
                    id: reverseButton
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    checked: reverseChecked
                    setIcon: "../assets/icons/circle-r.png"
                    checkable: true
                    iconColor: checked ? "#FFFFFF" : "#808080"
                    onClicked: setDriveMode("R")
                }

                PrefsButton {
                    id: neutralButton
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    checked: neutralChecked
                    setIcon: "../assets/icons/circle-n.png"
                    checkable: true
                    iconColor: checked ? "#FFFFFF" : "#808080"
                    onClicked: setDriveMode("N")
                }

                PrefsButton {
                    id: driveButton
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    checked: driveChecked
                    setIcon: "../assets/icons/circle-d.png"
                    checkable: true
                    iconColor: checked ? "#FFFFFF" : "#808080"
                    onClicked: setDriveMode("D")
                }

            }

        }
    }
}
