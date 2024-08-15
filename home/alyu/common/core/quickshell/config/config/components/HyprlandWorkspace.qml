import QtQuick
import Quickshell.Hyprland

Text {
    id: text
    required property int id
    required property string icon
    required property color default_color
    required property color empty_color
    required property color active_color

    text: icon
    color: empty_color

    Component.onCompleted: {
        Hyprland.rawEvent.connect(hyprEvent)
        colorWorkspace()
    }

    function hyprEvent(e) {
        if (e.name == "workspace") {
            if (e.data == id) {
                text.color = text.active_color
            } else {
                colorWorkspace()
            }
        }
    }

    function colorWorkspace() {
        if (Hyprland.workspaces.values.some((w) => {
            return w.id == id && w.lastIpcObject.windows > 0
        })) {
            text.color = text.default_color
        } else {
            text.color = text.empty_color
        }
    }
}
