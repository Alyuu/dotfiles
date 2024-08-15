import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
    id: container
    property var icons: {1: "一", 2: "二", 3: "三", 4: "四", 5: "五"}
    property int nWorkspaces: 5
    property font font
    property color default_color
    property color empty_color
    property color active_color

    Component.onCompleted: {
        var workspaceComponent = Qt.createComponent("../components/HyprlandWorkspace.qml");
        for (var i = 0; i <= nWorkspaces; i++) {
            var workspace = workspaceComponent
            .createObject(container, 
                {
                    id: i, 
                    icon: icons[i], 
                    font: font, 
                    default_color: default_color,
                    empty_color: empty_color,
                    active_color: active_color
                }
            )
            if (workspace == null) {
                console.log("Error creating workspace")
            }
        }
    }
}
