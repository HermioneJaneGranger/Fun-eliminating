//GameScene
import QtQuick 2.0
import "../common"
import gameSceneMessage 1.0

SceneBase {
    property int pressX
    property int releaseX
    property int pressY
    property int releaseY
    property bool mouseEnable
    signal pauseClicked
    id:gameScene
    anchors.centerIn: parent.Center
    Image {
        id: background
        source: "../../assets/gaming/background.png"
        anchors.fill: parent
        Image {
            id: pauseButton
            source: "../../assets/gaming/pause.png"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 3
            anchors.rightMargin: 3
            MouseArea{
                anchors.fill: parent
                onClicked: pauseClicked()
            }
        }
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 20
        MenuButton {

        }
        MenuButton {

        }
        MenuButton {

        }
        MenuButton {

        }
        MenuButton {

        }
    }
    Rectangle {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "black"
        border.width: 1
        color: "white"
        height: 384
        width:256
        opacity: 1
        Grid
        {
            id:grid
            anchors.fill: parent
            rows:12
            Repeater {
                id: square
                model:96
                Image {
                    id:image
                    property GameSceneBlock block: gameSceneMessage.blocks(index)

                    property int type: image.block.type

                    source: {
                        if(type === 0) {
                            return "../../assets/gaming/1.png"
                        }
                        else if(type === 1) {
                            return "../../assets/gaming/2.png"
                        }
                        else if(type === 2) {
                            return "../../assets/gaming/3.png"
                        }
                        else if(type === 3) {
                            return "../../assets/gaming/4.png"
                        }
                        else if(type === 4) {
                            return "../../assets/gaming/5.png"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        enabled: mouseEnable
                        drag.target: parent
                        property var start
                        property  var distance
                        onPressed:{
                            pressX= image.block.row
                            pressY = image.block.column
                            start = { x: mouse.x, y: mouse.y }
                        }
                        onReleased: {
                            distance = {x:mouse.x-start.x, y:mouse.y-start.y}
                        }
                    }
                }
            }
        }
    }
}
