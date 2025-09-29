import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls.Basic

Rectangle {
    property int vehicleMode: 0
    color: "#662b2323"
    radius: 15
    Layout.preferredWidth: 380
    Layout.preferredHeight: 262.5

    RowLayout {
        anchors.centerIn: parent
        spacing: 30

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 10
            Text {
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                Layout.rightMargin: 160
                Layout.bottomMargin: 50
                text: qsTr("Battery")
                font.pixelSize: 14
                font.weight: Font.Bold
                font.family: "Lato"
                color: "#50FFFFFF"
            }

            Image {
                id: mainBatteryImage
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                sourceSize: Qt.size(140,100)
                source: {
                    switch (vehicleMode) {
                    case 0:
                        return Qt.resolvedUrl("../assets/icons/homeScreenIcons/Ecobattery.png")
                    case 1:
                        return Qt.resolvedUrl("../assets/icons/homeScreenIcons/Sportbattery.png")
                    case 2:
                        return Qt.resolvedUrl("../assets/icons/homeScreenIcons/Normalbattery.png")
                    default:
                        return Qt.resolvedUrl("../assets/icons/homeScreenIcons/Ecobattery.png")
                    }
                }
            }

            Text {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("100")
                font.pixelSize: 14
                font.weight: Font.Bold
                font.family: "Lato"
                color: {
                    switch(vehicleMode){
                    case 0:
                        return "#5CD44A"
                    case 1:
                        return "#33acff"
                    case 2:
                        return "#FFFFFF"
                    default:
                        return "#5CD44A"
                    }
                }
            }
        }
        ColumnLayout {
            spacing: 10
            Layout.alignment: Qt.AlignHCenter

            Text {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                text: qsTr("Est. Distance")
                font.pixelSize: 15
                font.weight: Font.Bold
                font.family: "Lato"
                color: "#FFFFFF"
            }
            Text {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                text:{
                    switch(vehicleMode){
                    case 0:
                        return qsTr("240 miles left");
                    case 1:
                        return qsTr("168 miles left");
                    case 2:
                        return qsTr("190 miles left");

                    default:
                        return qsTr("240 miles left");
                    }
                }
                font.pixelSize: 14
                font.weight: Font.Bold
                font.family: "Lato"
                color: {
                    switch(vehicleMode){
                    case 0:
                        return "#5CD44A";
                    case 1:
                        return "#33acff";
                    case 2:
                        return "#FFFFFF";

                    default:
                        return "#5CD44A";
                    }
                }
            }

            Item {Layout.preferredHeight: 10}

            RowLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Text {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("with")
                    font.pixelSize: 10
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }

                Text {
                    Layout.alignment: Qt.AlignLeft
                    text:{
                        switch(vehicleMode){
                        case 0:
                            return qsTr("Normal Mode:");
                        case 1:
                            return qsTr("Normal Mode:");
                        case 2:
                            return qsTr("Echo Mode:");

                        default:
                            return qsTr("Normal Mode:");
                        }
                    }

                    font.pixelSize: 10
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: {
                        switch(vehicleMode){
                        case 0:
                            return "#FFFFFF";
                        case 1:
                            return "#FFFFFF";
                        case 2:
                            return "#5CD44A";

                        default:
                            return "#FFFFFF";
                        }
                    }
                }
            }

            Text {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                text:{
                    switch(vehicleMode){
                    case 0:
                        return qsTr("190 miles left");
                    case 1:
                        return qsTr("190 miles left");
                    case 2:
                        return qsTr("240 miles left");

                    default:
                        return qsTr("240 miles left");
                    }
                }
                font.pixelSize: 14
                font.weight: Font.Bold
                font.family: "Lato"
                color: "#FFFFFF"
            }

            Item {Layout.preferredHeight: 5}

            RowLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Text {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("with")
                    font.pixelSize: 10
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }

                Text {
                    Layout.alignment: Qt.AlignLeft
                    text:{
                        switch(vehicleMode){
                        case 0:
                            return qsTr("Sport Mode:");
                        case 1:
                            return qsTr("Echo Mode:");
                        case 2:
                            return qsTr("Sport Mode:");

                        default:
                            return qsTr("Sport Mode:");
                        }
                    }

                    font.pixelSize: 10
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: {
                        switch(vehicleMode){
                        case 0:
                            return "#33acff";
                        case 1:
                            return "#5CD44A";
                        case 2:
                            return "#33acff";

                        default:
                            return "#33acff";
                        }
                    }
                }
            }

            Text {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                text:{
                    switch(vehicleMode){
                    case 0:
                        return qsTr("168 miles left");
                    case 1:
                        return qsTr("240 miles left");
                    case 2:
                        return qsTr("168 miles left");

                    default:
                        return qsTr("168 miles left");
                    }
                }
                font.pixelSize: 14
                font.weight: Font.Bold
                font.family: "Lato"
                color: "#FFFFFF"
            }
        }
    }
}
