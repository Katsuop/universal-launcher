import QtQuick.Controls 2.15
import QtQuick 2.15
import "../components"
import "qrc:/qml/common/ui"
import UniversalLauncher 1.0

CustomPage {
    id: accounts
    pageTitle: qsTr("Accounts")

    Text{
        anchors {
            top: accounts.top
            topMargin: 60
            left: accounts.left
        }
        id: textaccount
        text: qsTr("Comptes enregistrées")
        font.pixelSize: 18
        font.capitalization: Font.AllUppercase
        color: AppGlobal.themes.current.textColor
    }

    ListView {
        id: listAccounts
        spacing: 15
        clip: true

        width: 340

        anchors {
            top: textaccount.bottom
            topMargin: 20
            bottom: btnContainer.top
        }

        ListModel {
            id: accountInfos
            ListElement { accountName: "Katsuo"; }   
            ListElement { accountName: "Katsuo 2"; }
            ListElement { accountName: "Katsuo 3"; }    
            ListElement { accountName: "Katsuo 4"; }   
            ListElement { accountName: "Katsuo 5"; }
            ListElement { accountName: "Katsuo 6"; }
            ListElement { accountName: "Katsuo 7"; }                                             
        }

        ScrollBar.vertical: UScrollBar {}

        Component {
            id: card
            Button {
                width: listAccounts.width
                height: 70
                background: Rectangle {
                    color: "#C4C4C4"
                    radius: 10
                }

                onClicked: listAccounts.currentIndex = index

                Image{
                    id: headPlayer
                    anchors {
                        left: parent.left
                        leftMargin: 20
                        verticalCenter: parent.verticalCenter
                    }
                    width: 48
                    height: 48
                    source: "/images/head.png"
                }

                Text {
                    id: nameAccount
                    text: accountName
                    color: "#fff"
                    font.pixelSize: 14
                    font.bold: true
                    anchors {
                        fill: parent
                        top: parent.top
                        topMargin: 10
                        left: headPlayer.right
                        leftMargin: 80
                    }
                }
            }
        }
    model: accountInfos
    delegate: card   
    }

    Item {
        id: btnContainer
        height: 50
        width: parent.width

        anchors {
            bottom: parent.bottom
            left: parent.left
        }

        UButton {
            id: btnPrevious
            btnText: qsTr("Ajouter un compte")
            iconPath: "/images/icons/arrow-alt-circle-left.svg"
            width: 175
            anchors {
                left: parent.left
                bottom: parent.bottom
            }
        }

     
    }        
}
