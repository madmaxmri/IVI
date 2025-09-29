import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import "Screens"
import "Buttons"
import "./Components"

Window {
    width: 1366
    height: 768
    minimumHeight: 768
    maximumHeight: 768
    minimumWidth: 1366
    maximumWidth: 1366

    visible: true
    title: qsTr("HMI")

    Component.onCompleted: window_Visibility(homeScreenRectangle)

    Image {
        id: background
        anchors.fill: parent
        source: Qt.resolvedUrl("assets/backgrounds/blue-wavy-background.jpg")
        asynchronous: true
        fillMode: Image.PreserveAspectCrop
    }

    Item {
        id: dateTime
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 80
            leftMargin: 140
        }

        DateTimeTile {
            anchors.fill: parent
        }
    }

    Rectangle {
        id: saperator
        height: 1
        opacity: 0.5
        color: "#6a6363"
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: 60
            rightMargin: 60
            bottomMargin: 80
        }
    }

    RowLayout {
        id: tabBar
        spacing: 120
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: saperator.bottom
        anchors.topMargin: 0

        ButtonGroup {
            id: tabGroup
            exclusive: true
        }

        TabButton {
            iconSource: Qt.resolvedUrl("assets/icons/home.png")
            checked: true
            ButtonGroup.group: tabGroup
            onClicked: window_Visibility(homeScreenRectangle)
        }

        TabButton {
            iconSource: Qt.resolvedUrl("assets/icons/steering-wheel.png")
            ButtonGroup.group: tabGroup
            onClicked: window_Visibility(vehicleScreenRectangle)
        }

        TabButton {
            iconSource: Qt.resolvedUrl("assets/icons/paper-plane.png")
            ButtonGroup.group: tabGroup
            onClicked: window_Visibility(naviScreenRectangle)
        }

        TabButton {
            iconSource: Qt.resolvedUrl("assets/icons/fan.png")
            ButtonGroup.group: tabGroup
            onClicked: window_Visibility(cabinScreenRectangle)
        }

        TabButton {
            iconSource: Qt.resolvedUrl("assets/icons/music-alt.png")
            ButtonGroup.group: tabGroup
            onClicked: window_Visibility(musicScreenRectangle)
        }

        TabButton {
            iconSource: Qt.resolvedUrl("assets/icons/phone-call.png")
            ButtonGroup.group: tabGroup
            onClicked: window_Visibility(callScreenRectangle)
        }

        TabButton {
            iconSource: Qt.resolvedUrl("assets/icons/settings.png")
            ButtonGroup.group: tabGroup
            onClicked: window_Visibility(settingsScreenRectangle)
        }
    }

    Item {
        id: homeScreenRectangle
        anchors.fill: parent
        anchors.topMargin: 120
        anchors.leftMargin: 60
        anchors.rightMargin: 60
        anchors.bottomMargin: 100
        visible: false

        HomeScreen {
            anchors.fill: parent
        }
    }

    Item {
        id: vehicleScreenRectangle
        anchors.fill: parent
        anchors.topMargin: 120
        anchors.leftMargin: 60
        anchors.rightMargin: 60
        anchors.bottomMargin: 100
        visible: false

        VehicleScreen {
            anchors.fill: parent
        }
    }

    Item {
        id: naviScreenRectangle
        anchors.fill: parent
        anchors.topMargin: 120
        anchors.leftMargin: 60
        anchors.rightMargin: 60
        anchors.bottomMargin: 100
        visible: false

        NavigationScreen {
            anchors.fill: parent
        }
    }

    Item {
        id: cabinScreenRectangle
        anchors.fill: parent
        anchors.topMargin: 120
        anchors.leftMargin: 60
        anchors.rightMargin: 60
        anchors.bottomMargin: 100
        visible: false

        CabinScreen {
            anchors.fill: parent
        }
    }

    Item {
        id: musicScreenRectangle
        anchors.fill: parent
        anchors.topMargin: 120
        anchors.leftMargin: 60
        anchors.rightMargin: 60
        anchors.bottomMargin: 100
        visible: false

        MusicScreen {
            anchors.fill: parent
        }
    }

    Item {
        id: callScreenRectangle
        anchors.fill: parent
        anchors.topMargin: 120
        anchors.leftMargin: 60
        anchors.rightMargin: 60
        anchors.bottomMargin: 100
        visible: false

        CallScreen {
            anchors.fill: parent
        }
    }

    Item {
        id: settingsScreenRectangle
        anchors.fill: parent
        anchors.topMargin: 120
        anchors.leftMargin: 60
        anchors.rightMargin: 60
        anchors.bottomMargin: 100
        visible: false

        SettingsScreen {
            anchors.fill: parent
        }
    }

    function window_Visibility(item) {
        const screens = [homeScreenRectangle, vehicleScreenRectangle, naviScreenRectangle, cabinScreenRectangle, musicScreenRectangle, callScreenRectangle, settingsScreenRectangle]

        for (var i = 0; i < screens.length; i++) {
            const screen = screens[i]
            const isVisible = screen === item
            screen.z = isVisible ? 1 : 0
            screen.enabled = isVisible
            screen.visible = isVisible
            screen.opacity = isVisible ? 1 : 0
        }
    }
}
