import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects
import QtLocation
import QtPositioning
import "../Buttons"

Rectangle {
    color: "#662b2323"
    radius: 15

    Item {
        id: mapContainer
        anchors.fill: parent
        z: 0

        layer.enabled: true
        layer.smooth: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: mapContainer.width
                height: mapContainer.height

                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: "white"
                }
            }
        }

        Plugin {
            id: mapPlugin
            name: "osm"
        }

        Map {
            id: map
            z: 4
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(12.9629, 77.5775)
            zoomLevel: 14
            copyrightsVisible: false

            property var startCentroid

            PinchHandler {
                id: pinch
                target: null
                onActiveChanged: if (active) {
                                     map.startCentroid = map.toCoordinate(
                                                 pinch.centroid.position, false)
                                 }
                onScaleChanged: delta => {
                                    map.zoomLevel += Math.log2(delta)
                                }
                onRotationChanged: delta => {
                                       map.bearing -= delta
                                   }
                grabPermissions: PointerHandler.TakeOverForbidden
            }

            WheelHandler {
                id: wheel
                acceptedDevices: Qt.platform.pluginName === "cocoa"
                                 || Qt.platform.pluginName
                                 === "wayland" ? PointerDevice.Mouse
                                                 | PointerDevice.TouchPad : PointerDevice.Mouse
                rotationScale: 1 / 120
                property: "zoomLevel"
            }

            DragHandler {
                id: drag
                target: null
                onTranslationChanged: delta => map.pan(-delta.x, -delta.y)
            }

            Shortcut {
                enabled: map.zoomLevel > map.minimumZoomLevel
                sequence: StandardKey.ZoomOut
                onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
            }
        }

        TextField {
            z: 6
            width: 509
            height: 45
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#FFFFFF"
            font.family: "Lato"
            font.pixelSize: 14
            font.weight: Font.Bold
            placeholderText: qsTr("Enter an address")
            leftPadding: 15
            placeholderTextColor: "#50FFFFFF"
            background: Rectangle {
                anchors.fill: parent
                radius: 45
                color: "#90252525"
            }
        }
    }

}
