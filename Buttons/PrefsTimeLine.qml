import QtQuick
import QtQuick.Controls

Item {
    property int mode: 0
    property alias model: repeater.model
    property color lineColor: Qt.rgba(80/255, 80/255, 80/255, 1)
    id: control
    implicitWidth: 380
    implicitHeight: layout_column.height

    QtObject {
        id: d
        property bool isLeft: control.mode === 0
        property bool isRight: control.mode === 1
        property bool isAlternate: control.mode === 2
        property bool hasLabel: {
            for (var i = 0; i < model.count; i++) {
                var label = model.get(i).label
                if (label !== undefined && label !== "") {
                    return true
                }
            }
            return false
        }

        property string stateName: {
            if (hasLabel) return "Center"
            if (isRight) return "Right"
            if (isAlternate) return "Center"
            return "Left"
        }
    }

    Rectangle {
        id: rect_line
        color: control.lineColor
        height: parent.height
        width: 2
        state: d.stateName
        states: [
            State {
                name: "Left"
                AnchorChanges { target: rect_line; anchors.left: control.left }
                PropertyChanges { target: rect_line; anchors.leftMargin: 7 }
            },
            State {
                name: "Right"
                AnchorChanges { target: rect_line; anchors.right: control.right }
                PropertyChanges { target: rect_line; anchors.rightMargin: 7 }
            },
            State {
                name: "Center"
                AnchorChanges { target: rect_line; anchors.horizontalCenter: control.horizontalCenter }
            }
        ]
    }

    Component {
        id: com_dot
        Rectangle {
            width: 16
            height: 16
            radius: 8
            border.width: 4
            color: "black"
            border.color: "#00AEEF"
        }
    }

    Component {
        id: com_label
        Text {
            property bool isRight: false
            horizontalAlignment: isRight ? Qt.AlignRight : Qt.AlignLeft
            text: modelData.label
            font.pixelSize: 8
        }
    }

    Component {
        id: com_text
        Text {
            property bool isRight: false
            horizontalAlignment: isRight ? Qt.AlignRight : Qt.AlignLeft
            text: modelData.text
            textFormat: Text.RichText
            font.pixelSize: 8
        }
    }

    Column {
        id: layout_column
        spacing: 30
        width: control.width

        Repeater {
            id: repeater
            Item {
                id: item_layout
                width: layout_column.width
                height: loader_text.height

                Loader {
                    id: item_loader
                    state: d.stateName
                    states: [
                        State { name: "Left";   AnchorChanges { target: item_loader; anchors.left: item_layout.left } },
                        State { name: "Right";  AnchorChanges { target: item_loader; anchors.right: item_layout.right } },
                        State { name: "Center"; AnchorChanges { target: item_loader; anchors.horizontalCenter: item_layout.horizontalCenter } }
                    ]
                    sourceComponent: model.dot ? model.dot() : com_dot
                }

                Loader {
                    property var modelData: control.model.get(index)
                    property bool isRight: state === "Right"
                    id: loader_label
                    sourceComponent: {
                        if (!modelData) return undefined
                        var labelDelegate = model.labelDelegate
                        if (labelDelegate instanceof Function && labelDelegate() instanceof Component)
                            return labelDelegate()
                        return com_label
                    }
                    state: {
                        if (d.isRight) return "Left"
                        if (d.isAlternate) return index % 2 === 0 ? "Right" : "Left"
                        return "Right"
                    }
                    states: [
                        State {
                            name: "Left"
                            AnchorChanges { target: loader_label; anchors.left: item_loader.right; anchors.right: item_layout.right }
                            PropertyChanges { target: loader_label; anchors.leftMargin: 14; anchors.rightMargin: 14 }
                        },
                        State {
                            name: "Right"
                            AnchorChanges { target: loader_label; anchors.right: item_loader.left; anchors.left: item_layout.left }
                            PropertyChanges { target: loader_label; anchors.leftMargin: 14; anchors.rightMargin: 14 }
                        },
                        State {
                            name: "Center"
                            AnchorChanges { target: loader_label; anchors.right: item_loader.left; anchors.left: item_layout.left }
                            PropertyChanges { target: loader_label; anchors.leftMargin: 14; anchors.rightMargin: 14 }
                        }
                    ]
                }

                Loader {
                    id: loader_text
                    property var modelData: control.model.get(index)
                    property bool isRight: state === "Right"
                    state: {
                        if (d.isRight) return "Right"
                        if (d.isAlternate) return index % 2 === 0 ? "Left" : "Right"
                        return "Left"
                    }
                    sourceComponent: {
                        if (!modelData) return undefined
                        var textDelegate = model.textDelegate
                        if (textDelegate instanceof Function && textDelegate() instanceof Component)
                            return textDelegate()
                        return com_text
                    }
                    states: [
                        State {
                            name: "Left"
                            AnchorChanges { target: loader_text; anchors.left: item_loader.right; anchors.right: item_layout.right }
                            PropertyChanges { target: loader_text; anchors.leftMargin: 14; anchors.rightMargin: 14 }
                        },
                        State {
                            name: "Right"
                            AnchorChanges { target: loader_text; anchors.right: item_loader.left; anchors.left: item_layout.left }
                            PropertyChanges { target: loader_text; anchors.leftMargin: 14; anchors.rightMargin: 14 }
                        },
                        State {
                            name: "Center"
                            AnchorChanges { target: loader_text; anchors.right: item_loader.left; anchors.left: item_layout.left }
                            PropertyChanges { target: loader_text; anchors.leftMargin: 14; anchors.rightMargin: 14 }
                        }
                    ]
                }
            }
        }
    }
}
