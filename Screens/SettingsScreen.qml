import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import "../SettingsComponent"
import "../Buttons"

Item {
    id: root

    Component { id: profilePage; Profile {} }
    Component { id: displayPage; Display {} }
    Component { id: bluetoothPage; Bluetooth {} }
    Component { id: mytripPage; MyTrips {} }
    Component { id: soundPage; Sound {} }
    Component { id: aboutPage; About {} }
    Component { id: systemNotificationPage; SystemNotification {} }
    Component { id: systemUpdatePage; SystemUpdate {} }


    function switchPage(index){
        switch(index){
        case 0: settingsLoader.sourceComponent = profilePage; break;
        case 1: settingsLoader.sourceComponent = displayPage; break;
        case 2: settingsLoader.sourceComponent = bluetoothPage; break;
        case 3: settingsLoader.sourceComponent = mytripPage; break;
        case 4: settingsLoader.sourceComponent = soundPage; break;
        case 5: settingsLoader.sourceComponent = aboutPage; break;
        case 6: settingsLoader.sourceComponent = systemNotificationPage; break;
        case 7: settingsLoader.sourceComponent = systemUpdatePage; break;
        }
    }

    RowLayout {
        anchors.fill: parent


        Pane {
            padding: 0
            Layout.preferredWidth: root.width * 0.18
            Layout.fillHeight: true

            background: Rectangle {
                anchors.fill: parent
                color: "#662b2323"
                radius: 15
                Image {
                    source: "../assets/icons/separator.png"
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            ListView {
                id: listItemView
                anchors.fill: parent
                highlightFollowsCurrentItem: true
                highlight: null
                spacing: 20
                clip: true

                model: [
                    "Profile", "Display", "Bluetooth", "MyTrip",
                    "Sound", "About", "Notification", "System Update"
                ]

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
                id: settingsLoader
                anchors.fill: parent
                sourceComponent: profilePage

                onLoaded: {
                        if (item) {
                            item.anchors.fill = parent
                        }
                    }
            }
        }
    }
}
