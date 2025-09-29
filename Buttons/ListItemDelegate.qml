import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

ItemDelegate {
    id: root
    property string title: ""

    highlighted: ListView.isCurrentItem
    height: 50
    hoverEnabled: true
    focus: highlighted

    background: Rectangle {
        anchors.fill: parent
        radius: 8
        color: root.highlighted ? "#00B1B2" : "transparent"
    }

    Text {
        anchors.centerIn: parent
        opacity: 0.87
        text: root.title
        font.pixelSize: root.highlighted ? 16 : 14
        font.weight: root.highlighted ? Font.DemiBold : Font.Normal
        color: root.highlighted ? "white" : "gray"
    }
}
