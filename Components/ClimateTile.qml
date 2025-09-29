pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt.labs.folderlistmodel
import Qt5Compat.GraphicalEffects

Rectangle {
    id: climateTile
    Layout.preferredHeight: 262.5
    Layout.preferredWidth: 380
    radius: 15
    color: "transparent"

    Item {
        id: imageContainer
        anchors.fill: parent
        z: 0

        layer.enabled: true
        layer.smooth: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: imageContainer.width
                height: imageContainer.height

                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: "white"
                }
            }
        }
        Image {
            anchors.fill: parent
            sourceSize: Qt.size(380, 270)
            source: Qt.resolvedUrl(`../assets/images/image${weatherModel.weather_code}.jpg`)
            fillMode: Image.PreserveAspectCrop
        }

        Rectangle {
            anchors.fill: parent
            color: "black"
            opacity: 0.5
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 18
        z: 1
        enabled: !locationModel.busy && !weatherModel.busy

        LiveWeatherModel {
            id: weatherModel
            weatherRequest: locationComboBox.currentValue ?? ""
            fahrenheit: fahrenheitSwitch.checked
        }

        LiveLocationModel {
            id: locationModel
            onUpdated: locationComboBox.currentIndex = 0
        }

        RowLayout {
            spacing: 12

            Image {
                visible: weatherModel.valid
                Layout.preferredHeight: 20
                Layout.preferredWidth: 20
                fillMode: Image.PreserveAspectFit
                source: Qt.resolvedUrl(`../assets/weather/icon${weatherModel.weather_code}.png`)
            }

            Label {
                visible: weatherModel.valid
                text: `${weatherModel.temp}${weatherModel.units}`
                font.pixelSize: 20
                Layout.alignment: Qt.AlignTop
                color: "white"
            }
        }

        TextField {
            id: locationTextField
            text: "Bengaluru"
            font.pixelSize: 18
            Layout.preferredWidth: climateTile.width / 2
            palette.text: "white"

            background: Rectangle {
                color: "black"
                opacity: 0.4
                radius: 10
            }

            onAccepted: locationModel.update(text)
            Component.onCompleted: locationModel.update(text)

            BusyIndicator {
                anchors.right: parent.right
                height: parent.height
                visible: !enabled
                palette.dark: "white"
            }
        }

        ComboBox {
            id: locationComboBox
            Layout.preferredWidth: climateTile.width / 2
            Layout.preferredHeight: 35
            currentIndex: 0
            model: locationModel
            textRole: "locationText"
            valueRole: "weatherRequest"

            background: Rectangle {
                color: "white"
                opacity: 0.7
                radius: 10
            }

            contentItem: Text {
                text: locationComboBox.displayText
                color: "black"
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 8
            }
        }


        RowLayout {
            spacing: 8
            Layout.alignment: Qt.AlignLeft

            Switch {
                id: fahrenheitSwitch
                checked: false
            }

            Label {
                text: "ºC / ºF"
                font.pixelSize: 18
                color: "white"
                verticalAlignment: Text.AlignVCenter
            }
        }


        ListView {
            id: forecastListView
            Layout.fillWidth: true
            Layout.preferredHeight: 140
            Layout.alignment: Qt.AlignBottom
            orientation: ListView.Horizontal
            model: weatherModel

            delegate: ColumnLayout {
                id: forecastDelegate
                width: ListView.view.width / forecastListView.count

                required property string time
                required property int weather_code
                required property real temp_max
                required property real temp_min
                required property string units

                Label {
                    text: Qt.formatDateTime(new Date(forecastDelegate.time), "ddd")
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: 10
                    color: "white"
                }

                Image {
                    source: Qt.resolvedUrl(`../assets/weather/icon${forecastDelegate.weather_code}.png`)
                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20
                    Layout.alignment: Qt.AlignHCenter
                    fillMode: Image.PreserveAspectFit
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                }

                Label {
                    text: forecastDelegate.temp_max + forecastDelegate.units
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: 10
                    color: "white"
                }

                Label {
                    text: forecastDelegate.temp_min + forecastDelegate.units
                    Layout.alignment: Qt.AlignHCenter
                    font.pixelSize: 10
                    color: "white"
                }
            }

            add: Transition {
                NumberAnimation {
                    property: "opacity"
                    duration: 500
                    from: 0
                    to: 1
                    easing.type: Easing.InOutCubic
                }
            }
        }
    }
}
