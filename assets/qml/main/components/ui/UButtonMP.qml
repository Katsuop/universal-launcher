import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import UniversalLauncher 1.0

Button {
    id: button

    default property alias btnText: label.text

    property url iconPath: ""
    property int iconWidth: 18
    property int iconHeight: 18

    width: iconPath == "" ? 100 : 140
    height: 35

    background: Rectangle {
        id: bg
        anchors.fill: button
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        
        
        radius: 5
        color: "#F97316"

    }

    states: [
        State {
            name: "NORMAL"
            PropertyChanges { target: bg; color: "#F97316" }
            PropertyChanges { target: label; color: "white" }
            PropertyChanges { target: iconOverlay; color: "white" }
        },
        State {
            name: "HOVER"
            PropertyChanges { target: bg; color: "#FB923C" }
            PropertyChanges { target: label; color: "white" }
            PropertyChanges { target: iconOverlay; color: "white" }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "HOVER"
            ColorAnimation { duration: 50; easing.type: Easing.InOutQuad }
        },
        Transition {
            from: "*"
            to: "NORMAL"
            ColorAnimation { duration: 50; easing.type: Easing.InOutQuad }
        }

    ]

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onPressed: function(mouse) { mouse.accepted = false }
    }

    onHoveredChanged: function() {
        if (button.hovered) {
            state = "HOVER"
        } else {
            state = "NORMAL"
        }
    }

    contentItem: Item {
        Image {
            id: icon
            source: iconPath
            anchors {
                leftMargin: 10
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconWidth
            height: iconHeight
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay {
            visible: button.iconPath != ""
            id: iconOverlay
            anchors.fill: icon
            source: icon
            color: "white"
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }

        Text {
            id: label
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors {
                verticalCenter: parent.verticalCenter
                margins: 10
                left: iconPath != "" ? iconOverlay.right : undefined
            }
        }
    }
}