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
        y:-1050

        MouseArea{
            id: dragArea
            anchors.fill: parent
            drag.target: parent
            drag.maximumY: -50
            drag.minimumY: -1050
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
