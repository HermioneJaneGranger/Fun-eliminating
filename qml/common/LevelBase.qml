//LevelBase
import QtQuick 2.7
import gameSceneMessage 1.0
import VPlay 2.0

Item {
    id: gameMessage
    anchors.fill: parent
    property int level
    property bool mouseEnabled
    signal refreshGrid
    signal reduceStep
    property bool initGame
    property var image1
    property var image2
    property bool transferControl: true

    //    property var imageRemove


    Grid {
        id: grid
        anchors.fill: parent
        rows: 12

        GameSceneMessage {
            id: gameScene
            property GameSceneMessage message: {
                gameScene.initScene(gameSceneMessage)
                if (transferControl)
                    gameScene.control(0, 0)
                return gameSceneMessage
            }

            onTypeChanged: {
                console.log("typeChanged")
                gameSceneMessage.initScene(gameScene)
                reduceStep()
//                square.allArea.swap(begin_x, begin_y, end_x, end_y)
                refreshGrid()
            }
    //        function swap(x_1,y_1,x_2,y_2){
    //        }

            onTypeChanged_down: {
                console.log("falldown")
                //            swap(begin_x,begin_y, end_x, end_y, image1, image2)
            }
            onTypeDestroy: {

                console.log("destroy")
                //            remove(x,y)
            }
            onFallDownAllBlock: {
                console.log("alldown")
                gameSceneMessage.initScene(gameScene)
                refreshGrid()
            }
            onClearAllBlocks: {
                console.log("allClear")
                gameSceneMessage.initScene(gameScene)
                refreshGrid()
            }

            onTypeNew: {
                console.log("new")
                //            newBlock(x,y)
            }
            onCannotClear: {
                transferControl = false
            }

            //        gameScene.control: (0,0)
        }

        Repeater {
            id: square
            model: 96
            Item {
                id: sibling
                width: 32
                height: 32
                property var number: index
                property var imageEnding: image
                MouseArea {
                    id: allArea
                    anchors.fill: parent
                    property var prePosition
                    property var distance
                    property int preX
                    property int curX
                    property int preY
                    property int curY
                    property var preImage
                    property var curImage
                    onPressed: {
                        //                        initLoading = false
                        prePosition = {
                            x: mouse.x,
                            y: mouse.y
                        }
                        console.log(mouse.x + "  dsd")
                        preY = number / 8
                        preX = index - preY * 8
                        //                        gameScene.control(0,0);
                    }
                    onReleased: {
                        distance = {
                            x: mouse.x - prePosition.x,
                            y: mouse.y - prePosition.y
                        }
                        var l = !containsMouse && preX === 0 && distance.x > 0
                        var l2 = !containsMouse && preX === 7 && distance.x < 0
                        var l3 = !containsMouse && preX !== 7 && preX !== 0
                                && distance.x < 0
                        var l4 = !containsMouse && preX !== 7 && preX !== 0
                                && distance.x > 0
                        curX = l ? (preX + 1) : (l2 ? (preX - 1) : (l3 ? (preX - 1) : (l4 ? (preX + 1) : preX)))
                        var l5 = !containsMouse && preY === 0 && distance.y > 0
                        var l6 = !containsMouse && preY === 11 && distance.y < 0
                        var l7 = !containsMouse && preY !== 11 && preY !== 0
                                && distance.y < 0
                        var l8 = !containsMouse && preY !== 11 && preY !== 0
                                && distance.y > 0
                        curY = l5 ? (preY + 1) : (l6 ? (preY - 1) : (l7 ? (preY - 1) : (l8 ? (preY + 1) : preY)))

                        curX = (Math.abs(distance.x) < Math.abs(
                                    distance.y)) ? preX : curX
                        curY = (Math.abs(distance.x) < Math.abs(
                                    distance.y)) ? curY : preY
                        var tempc = curX
                        curX = curY
                        curY = tempc
                        var tempp = preX
                        preX = preY
                        preY = tempp
                        console.log("prex " + preX + "  " + preY)
                        console.log("prex " + curX + "  " + curY)
                        preImage = square.itemAt(8 * preX + preY).imageEnding
                        curImage = square.itemAt(8 * curX + curY).imageEnding
                        image1 = preImage
                        image2 = preImage

                        gameScene.swap(preX, preY, curX, curY) /*.connect()*/
                    }
                }
                function swap(targetY, targetX, preY, preX, tar1, tar2) {
                    console.log("hhhhhhhhhh")
                    swapAnimation.complete()

                    if (targetX !== preX && targetY === preY) {
                        swapAnimation.target = tar1
                        swapAnimation.property = "y"
                        swapAnimation.from = tar1.y
                        swapAnimation.to = tar1.y + (targetX > preX ? -image.height : image.height)
                        swapAnimation2.target = tar2
                        swapAnimation2.property = "y"
                        swapAnimation2.from = tar2.y
                        swapAnimation2.to = tar2.y + (targetX > preX ? image.height : -image.height)

                        //                                        var temp = tar1
                        //                                        tar1 =tar2
                        //                                        tar2 = tar1
                    } else if (targetY !== preY && targetX === preX) {
                        swapAnimation.target = tar1
                        swapAnimation.property = "x"
                        swapAnimation.from = tar1.x
                        swapAnimation.to = tar1.x + (targetY > preY ? -image.width : image.width)
                        swapAnimation2.target = tar2
                        swapAnimation2.property = "x"
                        swapAnimation2.from = tar2.x
                        swapAnimation2.to = tar2.x + (targetY > preY ? image.width : -image.width)

                        //                                        var temp1 = tar1
                        //                                        tar1 =tar2
                        //                                        tar2 = tar1
                    } else
                        return

                    swapAnimation.start()
                    swapAnimation2.start()
                }

                Image {
                    id: image

                    property GameSceneBlock block: /*gameScene*/ gameScene.block(
                                                                     index)
                    property int type: block.type
                    property int pressX
                    property int pressY
                    property int releaseX
                    property int releaseY
                    signal singleBlockChanged

                    //                    function lll(i)
                    //                    {
                    //                        block = gameSceneMessage.block(i)/*.type*/
                    //                    }
                    source: {
                        if (type === 0) {
                            return "../../assets/gaming/1.png"
                        } else if (type === 1) {
                            return "../../assets/gaming/2.png"
                        } else if (type === 2) {
                            return "../../assets/gaming/3.png"
                        } else if (type === 3) {
                            return "../../assets/gaming/4.png"
                        } else if (type === 4) {
                            return "../../assets/gaming/5.png"
                        } else
                            return ""
                    }
                }
                NumberAnimation {
                    //交换动画
                    id: swapAnimation
                    duration: 150
                    onStopped: {
                        swapFinishedTimer.start() // trigger swapFinished
                    }
                }
                NumberAnimation {
                    //交换动画
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
                Item {
                    //消除时候启动，设可见度，逐渐消失动画结束后结束
                    id: particleItem
                    width: parent.width
                    height: parent.height
                    x: parent.width / 2
                    y: parent.height / 2
                    ParticleVPlay {
                        // 消除时候启动
                        id: bingoEffect
                        fileName: "../particles/BingoEffect.json"
                    }
                    opacity: 0
                    visible: opacity > 0
                    enabled: opacity > 0
                }
                function bingoEffectparticle() {
                    bingoEffect.start()
                }

                //                 消除时候启动
                NumberAnimation {
                    id: fadeOutAnimation
                    //                                    target: image
                    property: "opacity"
                    duration: 500
                    from: 1.0
                    to: 0
                    onStopped: {
                        //消除后结束
                        bingoEffect.stop()
                    }
                }
                function fadeOut(x, y) {
                    var tar = square.itemAt(8 * x + y).imageEnding
                    fadeOutAnimation.target = tar
                    fadeOutAnimation.start()
                }

                function remove(x, y) {
                    particleItem.opacity = 1
                    sparkleParticle.start()
                    //                    fadeOutAnimation.start()
                    fadeOut(x, y)
                }

                //                                 trigger fall down of block
                function fallDown(howMany) {
                    fallDownAnimation.complete()

                    fallDownAnimation.duration = 100 * howMany
                    fallDownAnimation.to = block.y + howMany * image.height

                    fallDownTimer.start()
                }

                // function to move block one step left/right/up or down
                function newBlock(x, y) {
                    var tar = square.itemAt(8 * x + y).imageEnding
                    fadeInAnimation.target = tar
                    fadeInAnimation.start()
                    fallDownAnimation.target = tar
                    fallDownTimer.start()
                }

                // 新方块出现时启动
                NumberAnimation {
                    id: fadeInAnimation
                    //                    target: image
                    property: "opacity"
                    duration: 1000
                    from: 0
                    to: 1
                }

                // 方块掉落
                NumberAnimation {
                    id: fallDownAnimation
                    //                    target: image
                    property: "y"
                    onStopped: {


                        //                        fallDownFinished(image)
                    }
                }

                // timer to wait with fall-down until other blocks fade out
                Timer {
                    //下落动画开始时触发
                    id: fallDownTimer
                    interval: fadeOutAnimation.duration //每列消除的时间段
                    repeat: false
                    running: false
                    onTriggered: {
                        fallDownAnimation.start()
                    }
                }
            }
        }
    }
}
