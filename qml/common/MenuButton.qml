//MenuButton
import QtQuick 2.0

Rectangle {
    id:menuButton
    width: 48
    height: 40
    color: "white"
    border.width: 1
    border.color: "black"

    signal commonButtonClicked(int pressX,int pressY,int releaseX,int releaseY)
    signal move(int mouse_x,int mouse_y,int x,int y)

    MouseArea {
        anchors.fill: parent
        property var pressX
        property var pressY
        property var releaseX
        property var releaseY
        onPressed: {
            pressX = mouse.x
            pressY = mouse.y
            menuButton.opacity = 0
            move(mouse.x,mouse.y,x,y)
        }
        onReleased: {
            releaseX = mouse.x
            releaseY = mouse.y
            menuButton.opacity = 0.5
            commonButtonClicked(pressX,pressY,releaseX,releaseY)
        }
        hoverEnabled: true
    }

}
