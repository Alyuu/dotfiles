import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications

PanelWindow {
    property list<Notification> notifications

    width: content.width
    height: content.height

    color: "#282828"

    WlrLayershell.layer: WlrLayer.Overlay

    ColumnLayout {
        id: content

        Text {
            text: "Test"
            color: "#50ffffff"
            font.pointSize: 22
        }
    }
}
