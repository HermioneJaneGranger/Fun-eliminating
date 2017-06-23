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
}
