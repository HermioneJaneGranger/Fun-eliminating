//MenuButton
import QtQuick 2.0

Rectangle {
    id:menuButton
    width: 48
    height: 40
    color: "white"
    border.width: 1
    border.color: "black"

    signal clicked

    MouseArea {
        anchors.fill: parent
        onClicked: menuButton.clicked()
        onPressed: menuButton.opacity = 0.5
        onReleased: menuButton.opacity = 1
        hoverEnabled: true
    }

}
