import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts

RadioButton {
    property alias iconSource: icon.source
    property bool isGlow: false

    id: control
    implicitHeight: 60
    implicitWidth: 60
    indicator: null

    Image {
        id: icon
        z: 1
        anchors.centerIn: parent
        width: parent.width * 0.5
        height: parent.height * 0.5
        fillMode: Image.PreserveAspectFit
        source: ""
        opacity: control.checked ? 1.0 : 0.5
        scale: control.pressed ? 1.0 : 0.8
        Behavior on scale {
            NumberAnimation { duration: 200 }
        }
    }

    background: Rectangle {
        anchors.fill: parent
        radius: 15
        color: control.checked ? "#58aecff5" : "transparent"
        border.color: control.checked ? "#66d4e6fa" : "transparent"
        border.width: 4
        Behavior on border.color {
            ColorAnimation { duration: 200 }
        }

        Rectangle {
            id: indicator
            property int mx
            property int my
            x: mx - width / 2
            y: my - height / 2
            height: width
            radius: width / 2
            color: isGlow ? Qt.lighter("#29BEB6") : Qt.lighter("#B8FF01")
        }
    }

    Rectangle {
        id: mask
        radius: 15
        anchors.fill: parent
        visible: false
    }

    OpacityMask {
        anchors.fill: background
        source: background
        maskSource: mask
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent
    }

    ParallelAnimation {
        id: anim
        NumberAnimation { target: indicator; property: "width"; from: 0; to: height * 1.1; duration: 200 }
        NumberAnimation { target: indicator; property: "opacity"; from: 0.9; to: 0; duration: 200 }
    }

    onPressed: {
        indicator.mx = mouseArea.mouseX
        indicator.my = mouseArea.mouseY
        anim.restart()
    }
}

