import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../Components"

Item {

    id: vehicleScreenView
    anchors.fill: parent
    GridLayout {
        id: grid
        anchors.fill: parent

        rows: 1
        columns: 3
        rowSpacing: 20
        columnSpacing: 20

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            AdasFeatureList {}
        }


        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.rowSpan: 1

        }

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 2
            Layout.columnSpan: 1
            Layout.rowSpan: 1



            BatteryTile {
                id: batteryTile
            }

            PowerControl {
                onModeChanged: (index)=> {
                    batteryTile.vehicleMode = index
                }
            }
        }
    }
}

