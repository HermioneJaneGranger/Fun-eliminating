//SelectLevelScene
import QtQuick 2.0
import "../common"

SceneBase {
    id: selectLevelScene
    anchors.centerIn: parent.Center
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
                id: levels0
                x: 168
                y: 1677
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
            }
            Image {
                id: levels1
                source: "../../assets/selectLevel/level.png"
                x: 79
                y: 1553
                width: 58
                height: 47
            }

            Image {
                id: levels2
                x: 199
                y: 1457
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
            }
            Image {
                id: levels3
                x: 107
                y: 1273
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
            }
            Image {
                id: levels4
                x: 223
                y: 1148
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
            }

            Image {
                id: levels5
                x: 149
                y: 786
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
            }

            Image {
                id: levels6
                x: 118
                y: 636
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
            }

            Image {
                id: levels7
                x: 60
                y: 388
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
            }

            Image {
                id: levels8
                x: 79
                y: 986
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
            }

            Image {
                id: levels9
                x: 134
                y: 506
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
            }
        }
    }
    Row {
        x: 435
        y: 484
        anchors.rightMargin: 15
        anchors.bottomMargin: -34
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        //        rows: 4
        spacing: 10
        Selectbutton {
            text: "成就"
        }
        Selectbutton {
            text: "商店"
        }
        Selectbutton {
            text: "精灵球"
        }
        Selectbutton {
            text: "更多"
        }
    }
    Grid {
        x: 592
        anchors.rightMargin: 8
        anchors.topMargin: -29
        anchors.top: parent.top
        anchors.right: parent.right

        rows: 3
        spacing: 8
        Selectbutton {
            text: "活动"
        }
        Selectbutton {
            text: "抽奖"
        }
        Selectbutton {
            text: "礼包"
        }
    }
    Grid {
        anchors.leftMargin: 8
        anchors.topMargin: -29
        anchors.top: parent.top
        anchors.left: parent.left

        rows: 2
        spacing: 8
        Selectbutton {
            text: "体力"
        }
        Selectbutton {
            text: "金币"
        }
    }
    Column{
        spacing: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        x: 0
        Rectangle{
            id: physicalStrengthRect
            radius: 25
            width: 90
            height: 30
            color: "#ffffff"
        }
        Rectangle{
            id: diamond
            radius: 25
            width: 90
            height: 30
            color: "#ffffff"
        }
        Rectangle{
            id: money
            radius: 25
            width: 90
            height: 30
            color: "#ffffff"
        }
    }
}
