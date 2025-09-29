import QtQuick
import PlayerController
import "../Buttons"

Rectangle {
  id: root

  property bool hidden: true

  signal searchRequested

  height: 320
  width: 200

  color: "#333333"

  Text {
    id: playlistText

    anchors {
      left: parent.left
      top: parent.top
      margins: 20
    }

    text: "Playlist"
    color: "white"
    font {
      bold: true
      pixelSize: 20
    }
  }

  ListView {
    id: listview

    anchors {
      top: playlistText.bottom
      bottom: addButton.top
      left: parent.left
      right: parent.right
      margins: 20
    }

    clip: true
    model: PlayerController
    spacing: 5

    delegate: Rectangle {
      id: delegate

      required property string audioTitle
      required property string audioAuthorName
      required property url audioSource
      required property url audioImageSource
      required property int index

      width: listview.width
      height: 40

      color: "#1e1e1e"

      Column {
        id: textsColumn

        anchors {
          top: parent.top
          left: parent.left
          right: removeButton.left
          margins: 5
        }

        spacing: 5

        Text {
          width: textsColumn.width
          elide: Text.ElideRight
          fontSizeMode: Text.Fit
          minimumPixelSize: 10
          color: "white"
          text: delegate.audioTitle

          font {
            pixelSize: 14
            bold: true
          }
        }

        Text {
          width: textsColumn.width
          elide: Text.ElideRight
          fontSizeMode: Text.Fit
          minimumPixelSize: 6
          color: "gray"
          text: delegate.audioAuthorName

          font {
            pixelSize: 10
          }
        }
      }

      MouseArea {
        id: delegateMouseArea

        anchors.fill: parent

        onClicked: {
          PlayerController.switchToAudioByIndex(delegate.index)
        }
      }

      ImageButton {
        id: removeButton

        anchors {
          right: parent.right
          verticalCenter: parent.verticalCenter
          rightMargin: 5
        }

        width: 30
        height: 30

        source: "../assets/icons/circle-trash.png"

        onClicked: {
          PlayerController.removeAudio(delegate.index)
        }
      }
    }
  }

  ImageButton {
    id: addButton

    anchors {
      left: parent.left
      bottom: parent.bottom
      margins: 20
    }

    source: "../assets/icons/add.png"

    width: 32
    height: 32

    onClicked: {
      root.searchRequested()
      root.hidden = true
    }
  }

  Behavior on x {
    PropertyAnimation {
      easing.type: Easing.InOutQuad
      duration: 200
    }
  }
}
