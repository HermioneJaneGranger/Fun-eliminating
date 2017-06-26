//LevelBase
import QtQuick 2.0
import gameSceneMessage 1.0

Item {
    id:gameMessage
    anchors.fill: parent
    property int level
    property bool mouseEnabled

    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        text: level
    }

    Grid
    {
        id:grid
        anchors.fill: parent
        rows:12
        property GameSceneMessage message: {
            gameSceneMessage.refresh(5)
            console.log("refresh")
            return gameSceneMessage

        }
        Repeater {
            id: square
            model:96
            Image {
                id:image

                property GameSceneBlock block:/*gameScene*/grid.message.blocks(index)

                property int type: block.type

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
//                    drag.target: parent
//                    property var start
//                    property  var distance
//                    onPressed:{
//                        pressX= image.block.row
//                        pressY = image.block.column
//                        start = { x: mouse.x, y: mouse.y }
//                    }
//                    onReleased: {
//                        distance = {x:mouse.x-start.x, y:mouse.y-start.y}
//                    }
                    enabled: mouseEnabled
                    onClicked: console.log(type)
                }
            }
        }
    }
}
