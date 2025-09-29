import QtQuick

Rectangle {
    id: root
    property int radius: 20
    property int radiusCorners: Qt.AlignLeft | Qt.AlignRight | Qt.AlignTop | Qt.AlignBottom

    color: "lightblue"

    Repeater {
        model: [
            { x: 0, y: 0,
              visible: internal.aligns(Qt.AlignLeft | Qt.AlignTop),
              radius: root.radius },
            { x: root.width - root.radius, y: 0,
              visible: internal.aligns(Qt.AlignRight | Qt.AlignTop),
              radius: root.radius },
            { x: 0, y: root.height - root.radius,
              visible: internal.aligns(Qt.AlignLeft | Qt.AlignBottom),
              radius: root.radius },
            { x: root.width - root.radius, y: root.height - root.radius,
              visible: internal.aligns(Qt.AlignRight | Qt.AlignBottom),
              radius: root.radius }
        ]

        Rectangle {
            x: modelData.x
            y: modelData.y
            width: modelData.radius
            height: width
            visible: modelData.visible
            radius: width / 2
            color: parent.color
        }
    }

    QtObject {
        id: internal
        function aligns(direction) {
            return (root.radiusCorners & direction) === direction
        }
    }
}
