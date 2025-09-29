import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "../Components"

Item {
    id: cabinScreenView
    anchors.fill: parent

    GridLayout {
        id: grid
        anchors.fill: parent

        rows: 1
        columns: 4
        rowSpacing: 20
        columnSpacing: 20

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            Loader {
                id: airControlTile
                width: 270
                height: 545
                source: "../Components/AirControl.qml"
            }
        }

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            CabinTempControl {
                id: cabinTempControl
            }

            SeatTile {
                id: driverSeatTile
                title: qsTr("Driver's Seat")
                temperature: 70
                heatSeatChecked: false
                fanSeatChecked: true
                celsius: cabinTempControl.celsius
            }
        }

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 2
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            SeatTile {
                title: qsTr("Back Seat")
                temperature: 68
                heatSeatChecked: true
                fanSeatChecked: false
                celsius: cabinTempControl.celsius
            }

            SeatTile {
                title: qsTr("Passenger Seat")
                temperature: 73
                heatSeatChecked: true
                fanSeatChecked: true
                celsius: cabinTempControl.celsius
            }
        }

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 3
            Layout.columnSpan: 4
            Layout.rowSpan: 1

            BatteryTile {}

            NotificationTile{}
        }

    }
}
