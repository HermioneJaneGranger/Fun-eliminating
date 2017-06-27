//LevelBase
import QtQuick 2.0
import gameSceneMessage 1.0
import VPlay 2.0

Item {
    id:gameMessage
    anchors.fill: parent
    property int level
    property bool mouseEnabled
    property bool wait: false
    GameSceneMessage{
        id: gameScene
        property GameSceneMessage message: {
            gameSceneMessage.refresh(5)
            return gameSceneMessage
        }
    }

    Grid
    {
        id:grid
        anchors.fill: parent
        rows:12

        Repeater {
            id: square
            model:96
            MouseArea{

            }

            Image {
                id:image

                property GameSceneBlock block:/*gameScene*/gameScene.message.blocks(index)

                property int type: block.type
                property int pressX
                property int pressY
                property int releaseX
                property int releaseY
                signal singleBlockChanged

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
                    property var prePostion
                    property var distance
                    id : imageMouse
                    anchors.fill: parent
                    drag.target: parent
                    enabled: mouseEnabled && (!wait)
                    drag.maximumX: pressX==8?(image.width*(pressX-1)):(image.width*(pressX))
                    drag.maximumY: pressY==8?(image.width*(pressY-1)):(image.width*(pressY))
                    drag.minimumX: pressX==1?(image.width*(pressX-1)):(image.width*(pressX-2))
                    drag.minimumY: pressY==1?(image.width*(pressY-1)):
                                              (image.width*(pressY-2))
                    onPressed: {
                        console.log("---"+square.itemAt(index).x + "  "+square.itemAt(index).y)
                        prePostion={x:(square.itemAt(index).x), y:(square.itemAt(index).y)}
                        pressX = image.block.column+1
                        pressY = image.block.row+1
                    }


                    onReleased:{
                        console.log(square.itemAt(index).x + "  "+square.itemAt(index).y)
                        distance={x:(square.itemAt(index).x-prePostion.x),y:(square.itemAt(index).y-prePostion.y)}
                        console.log("dssdsddd"+distance.x+"  "+distance.y)
                        releaseX = (Math.abs(distance.x) < image.width/2.0) ? pressX :( distance.x < 0)?pressX-1:pressX+1
                        console.log(pressX+"===="+pressY)
                        console.log(releaseX+"----"+releaseY)
                        blockChanged
                        wait=true
                    }
                }

            }
        }
    }
}
