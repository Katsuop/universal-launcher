import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/qml/common/ui"
import "."
import UniversalLauncher 1.0

Item {
    signal next()

    Text{
        id: text
        text: qsTr("Select Language")
        font.pixelSize: 18
        font.capitalization: Font.AllUppercase
        color: AppGlobal.themes.current.textColor

        anchors {
            top: parent.top
            topMargin: 30
            horizontalCenter: parent.horizontalCenter
        }
    }


    ListView {
        id: list
        spacing: 15
        clip: true

        width: 400
        highlightFollowsCurrentItem: true
        highlightMoveDuration: -1
        highlightMoveVelocity: -1

        anchors {
            top: text.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: 20
            bottomMargin: 20
            bottom: btnContainer.top
        }

        ScrollBar.vertical: UScrollBar {}

        Component {
            id: card

            Button {
                required property string modelData
                required property int index

                width: list.width
                height: 50

                HoverHandler{
                    id: hoverZone
                    cursorShape: Qt.PointingHandCursor
                }

                background: Rectangle {
                    color: if (card.hovered && index != list.currentIndex) {
                        AppGlobal.themes.current.backgroundColor2
                    } else {
                        "transparent"
                    }

                    radius: AppGlobal.themes.current.radius
                }

                onClicked: function() {
                    if (list.currentIndex != index) {
                        AppGlobal.translator.setLanguage(modelData)
                        list.currentIndex = index
                    }
                }

                contentItem: Text {
                    text: AppGlobal.translator.getHumanName(modelData)
                    color: list.currentIndex == index ? AppGlobal.themes.current.accentColor : AppGlobal.themes.current.textColor

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.capitalization: Font.Capitalize 
                    anchors {
                        fill: parent
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        model: AppGlobal.translator.languages
        delegate: card
        highlight: Rectangle {
            width: card.width; height: card.height
            color: AppGlobal.themes.current.backgroundColor2;
            radius: AppGlobal.themes.current.radius
        }
    }

    Item {
        id: btnContainer
        height: btnNext.height
        width: parent.width

        anchors {
            bottom: parent.bottom
        }

        UButton {
            id: btnNext
            btnText: qsTr("Next")
            iconPath: "/images/icons/arrow-alt-circle-right.svg"
            onClicked: next()

            anchors {
                right: parent.right
                bottom: parent.bottom
            }
        }
    }
}
