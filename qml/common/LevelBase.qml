//LevelBase
import QtQuick 2.7
import gameSceneMessage 1.0
import VPlay 2.0

Item {
    id:gameMessage
    anchors.fill: parent
    property int level
    property bool mouseEnabled
    property bool wait: false

    Grid
    {
        id:grid
        anchors.fill: parent
        rows:12
        property GameSceneMessage message: {
            gameSceneMessage.refresh(5)
            //            console.log("refresh")
            return gameSceneMessage

        }
        Repeater {
            id: square
            model:96
            Item{
                id: sibling
                width:32
                height:32
                property var number:index
                property var imageEnding: image
                MouseArea{
                    id:allArea
                    anchors.fill: parent
                    //                    containsMouse: true
                    //                    containsPress: true
                    property var prePosition
                    property var distance
                    property int preX
                    property int curX
                    property int preY
                    property int curY
                    property var preImage
                    property var curImage
                    onPressed: {
                        prePosition={x:mouse.x, y:mouse.y}
                        console.log(mouse.x+"  dsd")
                        preY=number/8
                        preX=index-preY*8
                    }
                    onReleased: {
//                        gameSceneMessage.swap(preX, preY, curX, curY)
                        distance={x:mouse.x-prePosition.x, y:mouse.y-prePosition.y}
                        var l = !containsMouse && preX === 0 && distance.x > 0
                        var l2 = !containsMouse && preX===7&&distance.x<0
                        var l3 = !containsMouse && preX !== 7 &&preX!==0&&distance.x < 0
                        var l4 = !containsMouse && preX !== 7 &&preX!==0&&distance.x > 0
                        curX = l?(preX+1):(l2?(preX-1):(l3?(preX-1):(l4?(preX+1):preX)))
                        var l5 = !containsMouse && preY === 0 && distance.y > 0
                        var l6 = !containsMouse && preY===11&&distance.y<0
                        var l7 = !containsMouse && preY !== 11 &&preY!==0&&distance.y< 0
                        var l8 = !containsMouse && preY !==11 &&preY!==0&&distance.y > 0
                        curY= l5?(preY+1):(l6?(preY-1):(l7?(preY-1):(l8?(preY+1):preY)))

                        curX = (Math.abs(distance.x) < Math.abs(distance.y)) ? preX :curX
                        curY = (Math.abs(distance.x) < Math.abs(distance.y)) ? curY :preY
                        var tempc = curX
                        curX = curY
                        curY = tempc
                        var tempp = preX
                        preX = preY
                        preY = tempp
                        console.log("prex "+preX+"  "+preY)
                        console.log("prex "+curX+"  "+curY)
                        preImage =square.itemAt(number).imageEnding
                        curImage = square.itemAt(8*curX+curY).imageEnding
//                        Connections{
//                            target:
//                            onTypeChanged
//                        }

                        gameSceneMessage.swap(preX, preY, curX, curY)
                        swap( preY, preX,curY, curX, preImage, curImage)


                    }

                }
                function swap(targetY, targetX,  preY, preX, tar1, tar2)
                {
                    swapAnimation.complete()

                    if(targetX !== preX&&targetY === preY)
                    {
                        swapAnimation.target=tar1
                        swapAnimation.property="y"
                        swapAnimation.from = tar1.y
                        swapAnimation.to=tar1.y+(targetX > preX ? -image.height: image.height)
                        swapAnimation2.target=tar2
                        swapAnimation2.property="y"
                        swapAnimation2.from = tar2.y
                        swapAnimation2.to = tar2.y+(targetX> preX ? image.height: -image.height)

                        //                                        var temp = tar1
                        //                                        tar1 =tar2
                        //                                        tar2 = tar1

                    }

                    else if(targetY !== preY && targetX === preX) {
                        swapAnimation.target=tar1
                        swapAnimation.property="x"
                        swapAnimation.from = tar1.x
                        swapAnimation.to = tar1.x+(targetY > preY ? -image.width: image.width)
                        swapAnimation2.target=tar2
                        swapAnimation2.property="x"
                        swapAnimation2.from = tar2.x
                        swapAnimation2.to = tar2.x+(targetY> preY ? image.width: -image.width)

                        //                                        var temp1 = tar1
                        //                                        tar1 =tar2
                        //                                        tar2 = tar1

                    }

                    else
                        return

                    swapAnimation.start()
                    swapAnimation2.start()
                }

                Image {
                    id:image

                    property GameSceneBlock block:/*gameScene*/grid.message.blocks(index)
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
                }
                NumberAnimation {//交换动画
                    id: swapAnimation
                    duration: 150
                    onStopped: {
                        swapFinishedTimer.start() // trigger swapFinished
                    }
                }
                NumberAnimation {//交换动画
                    id: swapAnimation2
                    duration: 150
                    onStopped: {
                        swapFinishedTimer.start() // trigger swapFinished
                    }
                }
                // timer to wait a bit before signal swap finished
                Timer {
                    id: swapFinishedTimer
                    interval: 50
                    //                                      onTriggered: swapFinished(pressX,pressY,releaseX, releaseY)
                }
            }
        }
    }
}
