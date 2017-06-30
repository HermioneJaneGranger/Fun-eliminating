//SelectLevelScene
import QtQuick 2.0
import "../common"

SceneBase {
    id: selectLevelScene
    anchors.centerIn: parent.Center

    signal levelsClicked
    property int levelChoose: 1
    property int passNumber/*: gameSceneMessage.passNumber()*/
    //    signal achivementSceneClicked
    //    signal shopSceneClicked
    //    signal moreSceneClicked
    //    signal bagSceneClicked
    signal exitClicked
    Image {
        id: selectLevelSceneImage1
        source: "../../assets/selectLevel/scene1.png"
        anchors.left: parent.left
        anchors.right: parent.right
        y: -1057
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        MouseArea {
            id: dragArea
            anchors.rightMargin: 0
            anchors.bottomMargin: 235
            anchors.leftMargin: 0
            anchors.topMargin: -235
            anchors.fill: parent
            drag.target: parent
            drag.maximumY: -50
            drag.minimumY: -1050

            Image {
                id: levels1
                x: 168
                y: 1677
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                Star {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                    type: {
                        if (passNumber >= (levelChoose)) {
                            console.log("passNumber_____________________" + passNumber + levelChoose)
                            return gameSceneMessage.passScore[levelChoose - 1]
                        }
                        else
                            return 0
                    }
                }
                Image {
                    opacity: passNumber == (levelChoose - 1) ? 1 : 0
                    source: "../../assets/tool/tool_block.png"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose: 1
                        if (passNumber >= levelChoose - 1) levelsClicked()
                        else levelChoose = 1
                    }
                }
            }
            Image {
                id: levels2
                source: "../../assets/selectLevel/level.png"
                x: 79
                y: 1553
                width: 58
                height: 47
                Star {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                    type: {
                        if (passNumber > (levelChoose)) {
                            console.log("passNumber_____________________" + passNumber + levelChoose)
                            return gameSceneMessage.passScore[levelChoose]
                        }
                        else
                            return 0
                    }
                }
                Image {
                    opacity: passNumber == (levelChoose) ? 1 : 0
                    source: "../../assets/tool/tool_block.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 2
                        if (passNumber >= levelChoose - 1) levelsClicked()
                        else levelChoose = 1
                    }
                }
            }

            Image {
                id: levels3
                x: 199
                y: 1457
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                Star {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                    type: {
                        if (passNumber > (levelChoose + 1))
                            return gameSceneMessage.passScore[levelChoose + 1]
                        else
                            return 0
                    }
                }
                Image {
                    opacity: passNumber == (levelChoose + 1) ? 1 : 0
                    source: "../../assets/tool/tool_block.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 3
                        if (passNumber >= levelChoose - 1) levelsClicked()
                        else levelChoose = 1
                    }
                }
            }
            Image {
                id: levels4
                x: 107
                y: 1273
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                Star {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                    type: {
                        if (passNumber > (levelChoose + 2))
                            return gameSceneMessage.passScore[levelChoose + 2]
                        else
                            return 0
                    }
                }
                Image {
                    opacity: passNumber == (levelChoose + 2) ? 1 : 0
                    source: "../../assets/tool/tool_block.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 4
                        if (passNumber >= levelChoose - 1) levelsClicked()
                        else levelChoose = 1
                    }
                }
            }
            Image {
                id: levels5
                x: 223
                y: 1148
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                Star {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                    type: {
                        if (passNumber > (levelChoose + 3))
                            return gameSceneMessage.passScore[levelChoose + 3]
                        else
                            return 0
                    }
                }
                Image {
                    opacity: passNumber == (levelChoose + 3) ? 1 : 0
                    source: "../../assets/tool/tool_block.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 5
                        if (passNumber >= levelChoose - 1) levelsClicked()
                        else levelChoose = 1
                    }
                }
            }


            Image {
                id: levels6
                x: 79
                y: 986
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                Star {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                    type: {
                        if (passNumber > (levelChoose +4 ))
                            return gameSceneMessage.passScore[levelChoose + 4]
                        else
                            return 0
                    }
                }
                Image {
                    opacity: passNumber == (levelChoose + 4) ? 1 : 0
                    source: "../../assets/tool/tool_block.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 6
                        if (passNumber >= levelChoose - 1) levelsClicked()
                        else levelChoose = 1
                    }
                }
            }

            Image {
                id: levels7
                x: 149
                y: 786
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                Star {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                    type: {
                        if (passNumber > (levelChoose + 5))
                            return gameSceneMessage.passScore[levelChoose + 5]
                        else
                            return 0
                    }
                }
                Image {
                    opacity: passNumber == (levelChoose + 5) ? 1 : 0
                    source: "../../assets/tool/tool_block.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 7
                        if (passNumber >= levelChoose - 1) levelsClicked()
                        else levelChoose = 1
                    }
                }
            }

            Image {
                id: levels8
                x: 118
                y: 636
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                Star {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                    type: {
                        if (passNumber > (levelChoose + 6))
                            return gameSceneMessage.passScore[levelChoose + 6]
                        else
                            return 0
                    }
                }
                Image {
                    opacity: passNumber == (levelChoose + 6) ? 1 : 0
                    source: "../../assets/tool/tool_block.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 8
                        if (passNumber >= levelChoose - 1) levelsClicked()
                        else levelChoose = 1
                    }
                }
            }

            Image {
                id: levels9
                x: 134
                y: 506
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                Star {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                    type: {
                        if (passNumber > (levelChoose + 7))
                            return gameSceneMessage.passScore[levelChoose + 7]
                        else
                            return 0
                    }
                }
                Image {
                    opacity: passNumber == (levelChoose + 7) ? 1 : 0
                    source: "../../assets/tool/tool_block.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 9
                        if (passNumber >= levelChoose - 1) levelsClicked()
                        else levelChoose = 1
                    }
                }
            }
            Image {
                id: levels10
                x: 60
                y: 388
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                Star {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: -3
                    type: {
                        if (passNumber > (levelChoose + 8))
                            return gameSceneMessage.passScore[levelChoose + 8]
                        else
                            return 0
                    }
                }
                Image {
                    opacity: passNumber == (levelChoose + 8) ? 1 : 0
                    source: "../../assets/tool/tool_block.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 10
                        if (passNumber >= levelChoose - 1) levelsClicked()
                        else levelChoose = 1
                    }
                }
            }


            Repeater {
            }
        }
    }
    Image {
        id: closes
        anchors.rightMargin: 3
        anchors.topMargin: 5
        source: "../../assets/selectLevel/bc.png"
        anchors.top: parent.top
        anchors.right: parent.right
        MouseArea {
            anchors.fill: parent
            onPressed: closes.opacity = 0.5
            onReleased: closes.opacity = 1
            onClicked: exitClicked()
        }
    }
    Row {
        x: 435
        y: 484
        anchors.rightMargin: 15
        anchors.bottomMargin: 0
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        spacing: 10
        Selectbutton {
            imageSource: "../../assets/selectLevel/jiangbei.png"
            onSelectButtonClicked: achivementSceneClicked()
        }
        Selectbutton {
            imageSource: "../../assets/selectLevel/shop.png"
            onSelectButtonClicked: shopSceneClicked()
        }
        Selectbutton {
            //imageSource: "../../assets/selectLevel/bag.png"
            onSelectButtonClicked: bagSceneClicked()
        }
        Selectbutton {
            imageSource: "../../assets/selectLevel/more.png"
            onSelectButtonClicked: moreSceneClicked()
        }
    }
    Column {
        spacing: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 5

        Rectangle {
            x: -2
            opacity: 0.9
            color: "white"
            width: 36
            height: 30
            radius: 25
        }
        Rectangle {
            x: -2
            opacity: 0.9
            color: "white"
            width: 36
            height: 30
            radius: 25
        }
        Rectangle {
            x: -2
            opacity: 0.9
            color: "white"
            width: 36
            height: 30
            radius: 25
        }
    }

    Column {
        spacing: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 5

        Selectbutton {
            imageSource: "../../assets/amazing/tx.png"
            onSelectButtonClicked: shopSceneClicked()
        }
        Selectbutton {
            imageSource: "../../assets/amazing/coin.png"
            onSelectButtonClicked: shopSceneClicked()
        }
        Selectbutton {
            imageSource: "../../assets/amazing/zs.png"
            onSelectButtonClicked: shopSceneClicked()
        }
    }
}
