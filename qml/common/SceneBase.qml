//SceneBase
import QtQuick 2.0
import VPlay 2.0

Scene {
    id: sceneBase
    width:  320
    height: 480
    opacity: 0
    visible: opacity > 0
    enabled:  visible

    Behavior on opacity {
        NumberAnimation{
            property: "opacity"
            easing.type: Easing.InOutQuad
        }
    }
}
