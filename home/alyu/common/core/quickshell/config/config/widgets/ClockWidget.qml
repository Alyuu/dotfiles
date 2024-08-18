import QtQuick
import "../services"
import "../components"

Text {
    property bool showNotification: false

    text: Time.time

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
        visible: showNotification

        anchors {
            top: parent.top
        }

        margins {
            top: 10
        }
    }

}
