import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris

RowLayout {
    id: root
    required property font custom_font
    property color default_color: "#8ec07c"
    property color hover_color: "#928374"
    property int text_width: 100

    spacing: 10

    Text {
        text: (Mpris.players.values.length > 0 && Mpris.players.values[0].trackTitle.length > 0) ? "" : "󰝛"
        color: mouse.hovered ? hover_color : default_color
        font: custom_font
        z: 1

        Text {
            visible: mouse.hovered
            color: default_color
            font: parent.font
            x: parent.width + text_width/2

            text: {
                var state = "";
                if (Mpris.players.values.length > 0 && Mpris.players.values[0].trackTitle.length > 0) {
                    switch (Mpris.players.values[0].playbackState) {
                        case 1:
                            state = "";
                            break;
                        case 2:
                            state = "";
                            break;
                        default:
                            state = "";
                    }
                }
                return state
            }
        }
    }

    Rectangle {
        id: bounding
        width: Math.min(text_width, content.width)
        height: content.height
        color: "transparent"
        clip: true

        Text {
            id: content
            color: mouse.hovered ? hover_color : default_color
            font: custom_font
            text: (Mpris.players.values.length > 0 && Mpris.players.values[0].trackTitle.length > 0) ? Mpris.players.values[0].trackTitle : ""
            clip: true

        }
    }

    Timer {
        interval: 50
        running: true
        repeat: true
        onTriggered: {
            bounding.width = Math.min(content.width, text_width)
            if (content.width > text_width) {
                if (content.x <= -content.width) {
                    content.x = text_width;
                } else {
                    content.x = content.x - 1;
                }
            }
        }
    }

    TapHandler {
        id: tapHandler
        gesturePolicy: TapHandler.ReleaseWithinBounds
        onTapped: {
            if (Mpris.players.values.length > 0) {
                if (Mpris.players.values[0].playbackState == 1) {
                    Mpris.players.values[0].pause();
                } else {
                    Mpris.players.values[0].play();
                }
            }
        }
    }

    HoverHandler {
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
        enabled: Mpris.players.values.length > 0 && Mpris.players.values[0].trackTitle.length > 0
    }
}

// Text {
//     property int tStart: 0
//     property int nChar: 15
//     property int countStopped: 15
//     property int counter: 0
//     property color default_color: "#8ec07c"
//     property color hover_color: "#689D6A"
//     
//     color: mouse.hovered ? hover_color : default_color
//
//     text: {
//         var output = "";
//         if (Mpris.players.values.length > 0 && Mpris.players.values[0].trackTitle.length > 0) {
//             output = Mpris.players.values[0].trackTitle;
//             output = `  ${output.substr(tStart, nChar)}`;
//         } else {
//             output = "󰝛";
//         }
//         return output
//     }
//
//     Text {
//         visible: mouse.hovered
//         color: default_color
//         font: parent.font
//         anchors.centerIn: parent
//         text: {
//             var state = "";
//             switch (Mpris.players.values[0].playbackState) {
//                 case 1:
//                     state = "";
//                     break;
//                 case 2:
//                     state = "";
//                     break;
//                 default:
//                     state = "";
//             }
//             return state
//         }
//     }
//
//     Timer {
//         interval: 250
//         running: true
//         repeat: true
//         onTriggered: {
//             if (counter < countStopped) {
//                 counter++;
//                 tStart = 0;
//             } else {
//                 if (tStart + nChar < Mpris.players.values[0].trackTitle.length) {
//                     tStart++;
//                 } else {
//                     counter = 0;
//                 }
//             }
//         }
//     }
//
//     TapHandler {
//         id: tapHandler
//         gesturePolicy: TapHandler.ReleaseWithinBounds
//         onTapped: {
//             if (Mpris.players.values.length > 0) {
//                 if (Mpris.players.values[0].playbackState == 1) {
//                     Mpris.players.values[0].pause();
//                 } else {
//                     Mpris.players.values[0].play();
//                 }
//             }
//         }
//     }
//
//     HoverHandler {
//         id: mouse
//         acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
//         cursorShape: Qt.PointingHandCursor
//     }
// }
