import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Switch {
    id: control
    property color backgroundColor: myPalette.highlight

    SystemPalette { id: myPalette; colorGroup: SystemPalette.Active }

    spacing: 10

    indicator: Rectangle {
        implicitHeight: 20
        implicitWidth: 56
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: height / 2
        color: control.checked ? control.backgroundColor : "#074041"
        border.width: control.checked ? 2 : 1
        border.color: control.checked ? control.backgroundColor : "transparent"

        Rectangle {
            id: knob
            width: 28
            height: 28
            radius: height / 2
            color: control.checked ? "#FFFFFF" : "#B3B3B3"
            anchors.verticalCenter: parent.verticalCenter
            x: control.checked ? parent.width - width - 2 : 2

            Behavior on x {
                NumberAnimation { duration: 300 }
            }
        }
    }

    contentItem: Text {
        font.pixelSize: 14
        text: control.text
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
