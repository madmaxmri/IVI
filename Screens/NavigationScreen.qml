import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQuick.VirtualKeyboard
import "../Components"

Item {
    id: navigationScreenView
    anchors.fill: parent
    GridLayout {
        id: grid
        anchors.fill: parent


        rows: 2
        columns: 2
        rowSpacing: 20
        columnSpacing: 20

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            MapTile {
                id: mapTile
                Layout.preferredWidth: 600
                Layout.fillHeight: true
            }

            KeyBoardTile {
                id: keyBoardTile
            }

        }
    }

}

