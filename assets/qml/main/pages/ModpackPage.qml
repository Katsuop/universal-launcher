import QtQuick.Controls 2.15
import QtQuick 2.0
import QtGraphicalEffects 1.15
import UniversalLauncher 1.0
import "../components"
import "../components/ui"

CustomPage {
    id: home
    pageTitle: qsTr("")
    
    Rectangle{
        id: radiusImg
        width: 720
        height: 200
        radius: 10
    

        Item{
            id: base
            anchors.fill: radiusImg
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: radiusImg
            }
            Rectangle{
                id: img
                width: 240
                height: 200
                Image{
                    id: backImage
                    source: "/images/background/mCard.jpg"
                    fillMode: Image.PreserveAspectCrop
                    sourceSize.width: 720
                    sourceSize.height: 200
                    anchors.verticalCenter: img.verticalCenter
                }


                Text{
                    id: modpackName
                    text: "Mod pack name"
                    font.pixelSize: 25
                    font.bold: true
                    font.capitalization: Font.AllUppercase
                    color: "white"
                    x: 20
                    y: 10
                }

                Text{
                    id: versionName
                    text: "Version :"
                    font.pixelSize: 15
                    font.capitalization: Font.AllUppercase
                    color: "white"
                    x: 585
                    y: 145
                }

                Text{
                    id: versionNumber
                    text: "1.0.0"
                    font.pixelSize: 15
                    color: "white"
                    x: 660
                    y: 145
                }

                Text{
                    id: mcversionName
                    text: "Minecraft version :"
                    font.pixelSize: 15
                    font.capitalization: Font.AllUppercase
                    color: "white"
                    x: 498
                    y: 165
                }

                Text{
                    id: mcversionNumber
                    text: "1.18.1"
                    font.pixelSize: 15
                    color: "white"
                    x: 660
                    y: 165
                }

                UButtonMP{
                    id: launch
                    btnText: "Installer"
                    iconPath: "/images/icons/play-circle.svg"
                    x: 30
                    y: 145
                }
            }
        }
    }

    Text{
        id: popularityText
        text: "Popularity :"
        font.pixelSize: 15
        color: AppGlobal.themes.current.textColor
        x: 518
        y: 225
    }

    Row{
        id: star
        x: 605
        y: 227
        Repeater{
            id: rStar
            model: 5
            ColorOverlay {
                visible: true
                id: iconOverlay
                anchors.fill: iconStar
                source: iconStar
                color: AppGlobal.themes.current.textColor
                antialiasing: true
                width: 20
                height: 20
                
            }
        }

    }

    Image {
        id: iconStar
        source: "/images/icons/star.svg"
        sourceSize.width: 20
        sourceSize.height: 20
        width: 20
        height: 20
        fillMode: Image.PreserveAspectFit
        visible: false
        antialiasing: true
    }


    Row{
        id: screenshot
        anchors.horizontalCenter: home.horizontalCenter
        spacing: 15
        y: 270
        layoutDirection: Qt.LeftToRight 
        Repeater{
            id: rScreenshot
            model: 4
            Rectangle {
                id: screen
                width: 175
                height: 100
                color: AppGlobal.themes.current.backgroundColor2
                radius: 5
            }
        }

    }

    Column{
        id: textColumn
        anchors.horizontalCenter: home.horizontalCenter
        spacing: 20
        y: 395
        Repeater{
            id: rTextColumn
            model: 4
            Text {
                width: 720
                font.pixelSize: 12
                id: textDescriptif
                text: "Repudiandae nesciunt tenetur eius voluptate et. Ratione ullam voluptas tempora voluptas nemo omnis sequi adipisci. Sed aut qui aut voluptate blanditiis ea. Alias ipsam illo officia sit."
                wrapMode: Text.Wrap
                color: AppGlobal.themes.current.textColor
            }
        }

    }
}