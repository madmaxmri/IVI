import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "../Components"

Item {
    id: callScreenView
    anchors.fill: parent

    GridLayout {
        id: grid
        anchors.fill: parent

        rows: 1
        columns: 2
        rowSpacing: 20
        columnSpacing: 20

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.rowSpan: 1


        }

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            PhoneTile {
                id: phoneTile
            }
        }

    }
}
