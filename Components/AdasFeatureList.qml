import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 1.15
import "../Buttons"
import "../AdasComponents"

Rectangle {
    width: 830
    height: 410
    radius: 15
    color: "transparent"

    Item {
        id: root
        anchors.fill: parent
        Component {
            id: blindspotPage
            BlindSpotDetection {}
        }

        Component {
            id: cruisecontrolPage
            CruiseControl {}
        }

        Component {
            id: emergencybreakPage
            EmergencyBreakingSystem {}
        }

        Component {
            id: lanechangePage
            LaneChange {}
        }

        Component {
            id: driveterrainPage
            DriveTerrainSystem {}
        }

        Component {
            id: parkingPage
            ParkingAssistance {}
        }

        function switchPage(index) {
            switch (index) {
            case 0:
                adasLoader.sourceComponent = blindspotPage
                break
            case 1:
                adasLoader.sourceComponent = cruisecontrolPage
                break
            case 2:
                adasLoader.sourceComponent = emergencybreakPage
                break
            case 3:
                adasLoader.sourceComponent = lanechangePage
                break
            case 4:
                adasLoader.sourceComponent = driveterrainPage
                break
            case 5:
                adasLoader.sourceComponent = parkingPage
                break
            default:
                console.warn("Unknown page index:", index)
            }
        }

        RowLayout {
            anchors.fill: parent
            Pane {
                padding: 0
                Layout.preferredWidth: root.width * 0.25
                Layout.fillHeight: true

                background: Rectangle {
                    anchors.fill: parent
                    color: "#662b2323"
                    radius: 15

                    Image {
                        height: root.height * 0.9
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        source: "../assets/icons/separator.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }

                ListView {
                    id: listItemView
                    anchors.fill: parent
                    highlightFollowsCurrentItem: true
                    highlight: null
                    spacing: 20
                    clip: true

                    model: ["Blind Spot Detection", "Cruise Control", "Emergency Break System", "Lane Change", "Drive & Terrain Mode", "Parking Assist"]

                    delegate: ListItemDelegate {
                        spacing: 20
                        title: modelData
                        width: listItemView.width
                        onClicked: {
                            ListView.view.currentIndex = index
                            root.switchPage(index)
                        }
                    }
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Loader {
                    id: adasLoader
                    anchors.fill: parent
                    sourceComponent: blindspotPage
                    onStatusChanged: {
                        console.log("ADAS Loader status:", status)
                    }
                    onLoaded: {
                        if (item) {
                            item.anchors.fill = parent
                            console.log("ADAS page loaded successfully")
                        } else {
                            console.warn("ADAS page failed to load")
                        }
                    }
                }
            }
        }
    }
}
