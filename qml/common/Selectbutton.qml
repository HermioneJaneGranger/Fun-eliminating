import QtQuick 2.0

Rectangle {
    id:button
    radius: 10
    color:"white"

    width: 40
    height: 30
    property alias text: buttonText.text
    signal selectButtonClicked

    Text {
      id: buttonText
      anchors.centerIn: parent
      font.pixelSize: 18
      color: "black"
    }

    MouseArea {
      id: mouseArea
      anchors.fill: parent
      hoverEnabled: true
      onClicked: selectButtonClicked()
      onPressed: button.opacity = 0.5
      onReleased: button.opacity = 1
    }
}
