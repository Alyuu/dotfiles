import QtQuick
import Quickshell.Services.Notifications
import "../components"

Text {
    id: root
    property bool showNotification: false

    text: "  " + notifServer.trackedNotifications.values.length

    NotificationServer {
        id: notifServer
        onNotification: (notification) => {
            notification.tracked = true
        }
    }

    HoverHandler {
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }

    TapHandler {
        id: tapHandler
        gesturePolicy: TapHandler.ReleaseWithinBounds
        onTapped: showNotification = !showNotification
    }

    NotificationPanel {
        custom_font: root.font
        text_color: root.color
        visible: showNotification

        anchors {
            top: parent.top
        }

        margins {
            top: 10
        }
    }
}
