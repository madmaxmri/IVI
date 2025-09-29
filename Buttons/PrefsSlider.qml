import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Slider {
    id: control
    property bool labelVisible: true
    property int handleSize: 12
    property color checkedColor: "#00B1B2"
    property color handlerColor: "#212325"
    property bool tooltipVisible: true

    width: 450
    height: 6
    leftPadding: 5
    from: 0
    to: 100

    background: Rectangle {
        x: -2
        y: control.topPadding + control.availableHeight / 2 - height / 2
        width: control.availableWidth
        height: 6
        radius: height / 2
        color: "gray"

        Rectangle {
            width: control.visualPosition === 0 ? 0 : control.handle.x + control.handle.width
            height: parent.height
            color: control.checkedColor
            radius: height / 2
            layer.enabled: control.pressed
            layer.effect: DropShadow {
                transparentBorder: true
                color: control.checkedColor
                samples: 8
            }
        }
    }

    handle: Rectangle {
        visible: labelVisible
        x: control.visualPosition * (control.availableWidth - width) - 2
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: handleSize
        implicitHeight: handleSize
        radius: width / 2
        color: "transparent"
        border.width: 2
        border.color: handlerColor

        layer.enabled: control.pressed
        layer.effect: DropShadow {
            transparentBorder: true
            color: control.checkedColor
            samples: 10
        }

        Image {
            visible: control.visualPosition > 0 && tooltipVisible
            sourceSize: Qt.size(20,20)
            source: "../assets/icons/comment.png"
            anchors.bottom: parent.top
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 3
                text: control.value.toFixed(0) + "%"
                font.pixelSize: 8
                color: "black"
            }
        }
    }
}
