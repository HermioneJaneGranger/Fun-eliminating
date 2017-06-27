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
            MouseArea{

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
                //                Item {//消除时候启动，设可见度，逐渐消失动画结束后结束
                //                    id: particleItem
                //                    width: parent.width
                //                    height: parent.height
                //                    x: parent.width/2
                //                    y: parent.height/2

                //                    ParticleVPlay {// 消除时候启动
                //                        id: bingoEffect
                //                        fileName: "../particles/BingoEffect.json"
                //                    }
                //                    opacity: 0
                //                    visible: opacity > 0
                //                    enabled: opacity > 0
                //                }
                // 消除时候启动
                //                NumberAnimation {
                //                    id: fadeOutAnimation
                //                    target: image
                //                    property: "opacity"
                //                    duration: 500
                //                    from: 1.0
                //                    to: 0
                //                    onStopped: {//消除后结束
                //                        bingoEffect.stop()
                //                    }
                //                }
                //                // 新方块出现时启动
                //                NumberAnimation {
                //                    id: fadeInAnimation
                //                    target: image
                //                    property: "opacity"
                //                    duration: 1000
                //                    from: 0
                //                    to: 1
                //                }

                //                // 方块掉落
                //                NumberAnimation {
                //                    id: fallDownAnimation
                //                    target: image
                //                    property: "y"
                //                    onStopped: {
                //                        fallDownFinished(image)
                //                    }
                //                }

                //                // timer to wait with fall-down until other blocks fade out
                //                Timer {//下落动画开始时触发
                //                    id: fallDownTimer
                //                    interval: fadeOutAnimation.duration//每列消除的时间段
                //                    repeat: false
                //                    running: false
                //                    onTriggered: {
                //                        fallDownAnimation.start()
                //                    }
                //                }

                //                // timer to wait a bit before signal swap finished
                //                Timer {
                //                    id: signalSwapFinished
                //                    interval: 50
                //                    onTriggered: swapFinished(block.previousRow, block.previousColumn, block.row, block.column)
                //                }

                //                // animation to move a block after swipe
                //                NumberAnimation {
                //                    id: swapAnimation
                //                    target: image
                //                    duration: 150
                //                    onStopped: {
                //                        signalSwapFinished.start() // trigger swapFinished
                //                    }
                //                }

                //                function remove() {
                //                    particleItem.opacity = 1
                //                    sparkleParticle.start()
                //                    fadeOutAnimation.start()
                //                }

                // trigger fall down of block
                //                function fallDown(howMany) {
                //                    fallDownAnimation.complete()

                //                    fallDownAnimation.duration = 100 * howMany
                //                    fallDownAnimation.to = block.y + howMany * image.height

                //                    fallDownTimer.start()
                //                }

                //                // function to move block one step left/right/up or down
                //                function swap(targetRow, targetCol) {
                //                    swapAnimation.complete()

                //                    block.previousRow = block.row
                //                    block.previousColumn = block.column

                //                    if(targetRow !== block.row) {
                //                        swapAnimation.property = "y"
                //                        swapAnimation.to = block.y +
                //                                (targetRow > block.row ? block.height : -block.height)
                //                        block.row = targetRow
                //                    }
                //                    else if(targetCol !== block.column) {
                //                        swapAnimation.property = "x"
                //                        swapAnimation.to = block.x +
                //                                (targetCol > block.column ? block.width : -block.width)
                //                        block.column = targetCol
                //                    }
                //                    else
                //                        return

                //                    swapAnimation.start()
                //                }

                ////                function fadeIn() {
                ////                    fadeInAnimation.start()
                ////                }


            }
        }
    }
}
