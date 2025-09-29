import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import "../Components"

Item {
    id: homeScreenView
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

            ClimateTile {
                id: climate
            }

            MusicTile {
                id: musicTile
                Layout.preferredWidth: 380
                Layout.preferredHeight: 262.5
            }

        }

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            SummaryTile {}
        }

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 2
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            BatteryTile {}

            NotificationTile {}
        }

    }
}
