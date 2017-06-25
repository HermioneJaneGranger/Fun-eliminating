import QtQuick 2.0
import "../common"

SceneBase{
    id: achievementScene
    anchors.centerIn: parent.Center


    Rectangle{
        id: boardRect
        x: 80
        y: 0/*-30*/
        radius: 20
        color: "#92f3a9"
        gradient: Gradient {
            GradientStop {
                position: 0.14;
                color: "#04f73d";
            }
            GradientStop {
                position: 1.00;
                color: "#ffffff";
            }
        }
        border.color: "#40d716"
        width: parent.width-160
        height: 40
//        FontLoader{
//            id: achievementFont
//            source: "../../assets/fonts/akaDylan Plain.ttf"
//        }
        Text {
            id: achievementName
            text: qsTr("Achievements!")
//            font.family: achivementFont
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            color: "#d1c2a7"
            anchors.centerIn: parent
        }
    }
}
