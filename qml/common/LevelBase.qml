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
    property int removeX:-1
    property int removeY:-1

    property int pressX:0
    property int pressY:0
    property int releaseX:0
    property int releaseY:0
    property int downX
    property int downY
    property bool transferControl: true
    property bool refreshTypeChanged: false

    property bool swapFinished: false
    property  bool  swapEnabled: false
    property int removesEnabled//destroy
    property bool newEnabeled: false
    property bool downEnabled: false//changed down

    Loader{
        id:lod
        sourceComponent: com
    }
    Timer{
        id:r
        interval: 8000
        onTriggered: {
            console.log("timer--------------------------" + gameSceneCenter.reminds(0)
                        + gameSceneCenter.reminds(1) +gameSceneCenter.reminds(2)+gameSceneCenter.reminds(3))
            i.getX_1 = gameSceneCenter.reminds(1) * 32
            i.getY_1 = gameSceneCenter.reminds(0) * 32
            i.getX_2 = gameSceneCenter.reminds(3) * 32
            i.getY_2 = gameSceneCenter.reminds(2) * 32
            i.opacity = 0.5
        }

    }
    Timer{
        id:afterswaptimer
        interval: 50
        onTriggered: {
            console.log("timer--------------------------")
            lod.sourceComponent = null
            lod.sourceComponent = com
        }

    }
    Timer{
        id:step_two
        interval: 350
        onTriggered: {
            console.log("timer--------------------------")
            lod.sourceComponent = null
            lod.sourceComponent = com
        }

    }

    Timer{
        id:step_one
        interval: 200
        onTriggered: {
            downEnabled = true
            lod.sourceComponent = null
            lod.sourceComponent = com
            console.log("enable_clear         *************************")
        }

    }

    Timer{
        id:step_three
        interval: 200
        onTriggered: {
//            downEnabled = true
            lod.sourceComponent = null
            lod.sourceComponent = com
            console.log("enable _fallDown        *************************")
        }

    }



    GameSceneMessage{
        signal destroy_x_y(int x,int y)
        id: gameSceneCenter
        property GameSceneMessage message: {
            gameSceneCenter.initScene(gameSceneMessage)

            return gameSceneMessage
        }
        onCannotClear: {
            transferControl = false
            downEnabled = false
        }

    }

    Connections{
        target: gameScene
        onToolBlock: {
            gameSceneCenter.clearBlock(x,y)
            console.log("tool==============" + x + y )
        }
        onToolLinex: {
            gameSceneCenter.clearLineX(x)
            console.log("tool==============" + x )
        }
        onToolLiney: {
            gameSceneCenter.clearLineY(y)
            console.log("tool==============" + y )
        }
        onToolType: {
            gameSceneCenter.clearType(type)
            console.log("tool==============" + type )
        }
    }

    Connections{
        target: gameSceneCenter
        onTypeChanged: {
            reduceStep()
            refreshGrid()
            gameSceneMessage.initScene(gameSceneCenter)
            swapEnabled = true
            transferControl = true
            console.log("                        ooooooooooooooooo")
            afterswaptimer.start()
        }
        onClearAllBlocks: {
            console.log("allClear")
            gameSceneMessage.initScene(gameSceneCenter)
            refreshGrid()

            step_one.start()
            //timer xialuo
        }
        onTypeChanged_down: {
            console.log("falldown")
            //                    gameSceneMessage.initScene(gameScene)
            //            downEnabled = true

            gameSceneMessage.initScene(gameSceneCenter)
            refreshGrid()
            step_three.start()
        }
        onTypeNew: {
            console.log("new")
            //            gameSceneMessage.initScene(gameScene)
            //                    afterswaptimer.start()
            //            newBlock(x,y)
            gameSceneMessage.initScene(gameSceneCenter)
            refreshGrid()
            step_three.start()
        }
//        onTypeDestroy: {
//            //                    gameSceneMessage.initScene(gameScene)
//            //                console.log("removeX,removeY"+removeX+"  "+removeY)
//            //                    afterswaptimer.start()
//            step_two.one()
//            //                        grid.remove(x,y,removeImage)
//        }
        onFallDownAllBlock:{
            console.log("fill down all ====================")
            transferControl = true
            downEnabled = false
            refreshGrid()
            gameSceneMessage.initScene(gameSceneCenter)
            r.start()
        }
    }

    Loader {
        id:remind
    }
//    Component{
//        id:rem
        Item{
            opacity:0
            id:i
            property int getX_1:0
            property int getY_1:0
            property int getX_2:0
            property int getY_2:0
            Rectangle {
                x:i.getX_1
                y:i.getY_1
                width: 32
                height: 32
                border.color: "yellow"
                border.width: 2
            }
            Rectangle {
                x:i.getX_2
                y:i.getY_2
                width: 32
                height: 32
                border.color: "yellow"
                border.width: 2
            }
        }
//    }

    Component{
        id:com
        Grid
        {
            Component.onCompleted: {
                if(transferControl) {
                    gameSceneCenter.control(pressX, pressY, releaseX,releaseY)
                    //                                        gameScene.control(0,0)
                    transferControl = false
                }
                if(downEnabled) {
                    downEnabled = false
                    gameSceneCenter.moveBlocks()
                }
            }
            id:grid
            anchors.fill: parent
            rows:12


            Repeater {
                id: square
                model:96

                Item{
                    id: item1
                    width:32
                    height:32
                    property var number:index
                    property var imageEnding: image

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
                        onStopped: {}
                    }
                    // timer to wait with fall-down until other blocks fade out
                    Timer {//下落动画开始时触发
                        id: fallDownTimer
                        interval: fadeOutAnimation.duration//每列消除的时间段
                        repeat: false
                        running: false
                        onTriggered: {
                            fallDownAnimation.start()
                        }

                    }
                    function sss()
                    {
                        fallDownAnimation.target=square.itemAt(index)
                        fallDownAnimation.from=y
                        fallDownAnimation.to = y+32
                        fallDownTimer.running=true
                    }



                    Item {//消除时候启动，设可见度，逐渐消失动画结束后结束
                        id: particleItem
                        width: 32
                        height: 32
                        x: parent.width/2
                        y: parent.height/2
                        ParticleVPlay {// 消除时候启动
                            id: bingoEffect
                            fileName: "../particles/BingoEffect.json"
                        }
                        opacity: 0
                        visible: opacity > 0
                        enabled: opacity > 0
                    }
                    //                 消除时候启动
                    NumberAnimation {
                        id: fadeOutAnimation
                        property: "opacity"
                        easing.type: Easing.InQuad
                        duration: 150
                        from: 1.0
                        to: 0
                        onStopped: {//消除后结束
                            console.log("消")
                            bingoEffect.stop()
                        }
                    }
                    NumberAnimation {//交换动画
                        id: swapAnimation
                        duration: 150
                        onStopped: {
                            //                                refreshTypeChanged = true
                            console.log("stoped")
                            //                            swapFinishedTimer.start() // trigger swapFinished
                        }
                    }
                    NumberAnimation {//交换动画
                        id: swapAnimation2
                        duration: 150
                    }

                    Timer {
                        id: swapFinishedTimer
                        interval: 50
                        onTriggered:
                        {
                            console.log("sssssssssssssssss")
                            swapFinished = true
                            console.log(removeX)
                            removesss(removeX,removeY)
                            //                removesEnabled = true
                        }
                    }
                    function swap1(preX, preY,  targetX, targetY)
                    {
                        console.log("swap1111")
                        console.log(preX+ "  "+preY)
                        swapAnimation.complete()
                        swapAnimation.complete()
                        var tar11 = square.itemAt(8*preX+preY)
                        var tar12 = square.itemAt(8*targetX+targetY)
                        var tar1 = tar11
                        var  tar2 = tar12
                        console.log(tar2.x)
                        if(targetX !== preX&&targetY === preY)
                        {
                            swapAnimation.target= tar1
                            swapAnimation.property="y"
                            swapAnimation.from = tar1.y
                            swapAnimation.to=tar1.y+(targetX > preX ? 32: -32)
                            swapAnimation2.target=tar2
                            swapAnimation2.property="y"
                            swapAnimation2.from = tar2.y
                            swapAnimation2.to = tar2.y+(targetX> preX ? -32: 32)

                        }
                        else if(targetY !== preY && targetX === preX) {
                            swapAnimation.target=tar1
                            swapAnimation.property="x"
                            swapAnimation.from = tar1.x
                            swapAnimation.to = tar1.x+(targetY > preY ? 32: -32)
                            swapAnimation2.target=tar2
                            swapAnimation2.property="x"
                            swapAnimation2.from = tar2.x
                            swapAnimation2.to = tar2.x+(targetY> preY ? -32: 32)


                        }
                        else
                            return

                        swapAnimation.start()
                        swapAnimation2.start()

                    }

                    function removesss(x,y)
                    {
                        var tar11 = square.itemAt(8*x+y)
                        var tar1 = tar11
                        console.log(tar1.x)
                        particleItem.opacity = 1
                        particleItem.x = tar1.x+16
                        particleItem.y = tar1.y+16
                        console.log("tar1    "+ tar1.x + "remove  " + x)
                        console.log("fade")
                        bingoEffect.start()
                        fadeOutAnimation.target = tar1
                        fadeOutAnimation.start()
                        //                    }
                    }


                    MouseArea{
                        id:allArea
                        anchors.fill: parent
                        enabled: mouseEnabled
                        property var prePosition
                        property var distance
                        property int preX
                        property int curX
                        property int preY
                        property int curY

                        onPressed: {
                            i.opacity = 0
                            prePosition={x:mouse.x, y:mouse.y}
                            console.log(mouse.x+"  dsd")
                            preY=number/8
                            preX=index-preY*8
                        }
                        onReleased: {
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

                            pressX = preX
                            pressY = preY
                            releaseX = curX
                            releaseY = curY
                            console.log("prex "+preX+"  "+preY)
                            console.log("prex "+curX+"  "+curY)

                            //                        if(removesEnabled > 1)

                            gameSceneCenter.swap(preX, preY, curX, curY)
                            if(swapEnabled) {
                                item1.swap1(preX,preY, curX, curY)
                                swapEnabled = false
                            }
                            console.log("-----swapEnabled------"+swapEnabled+"-----removesEnabl------"+removesEnabled+"------swapFinished----"+swapFinished)
                            console.log(removeX +"cc"+ removeY)
                            //                        item1.removesss()


                        }
                    }

                    Image {
                        id:image

                        property GameSceneBlock block:gameSceneCenter.block(index)
                        property int type: block.type
                        signal singleBlockChanged
                        //                        Text{
                        //                            text:index}
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
                            else{
                                item1.sss()
                                return ""
                            }
                        }
                    }
                }
            }
        }
    }
}
