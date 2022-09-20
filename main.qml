import QtQuick 2.9
import QtQuick.Window 2.2

Window
{
    id: myWindow
    visible: true
    width: 480
    height: 740
    title: qsTr("Calculator")

    Item
    {
        width: myWindow.width
        height: myWindow.height

        Rectangle
        {
            id: rootRect
            x: 20; y: 20
            color: "grey"
            width: myWindow.width - x * 2
            height: myWindow.height - y * 2

            Rectangle
            {
                id: diplay
                x: 10
                y: 10
                color: "#f5f5f5"
                width: rootRect.width - x * 2
                height: 130

                TextInput
                {
                    id: displayText
                    x: 5; y: 5
                    width: diplay.width - x * 2
                    height: diplay.height - y * 2
                    font.pixelSize: 36
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignBottom
                    font.family: "Cascadia Code"
                    text: ""
                }
            }

            Rectangle
            {
                id: keysArea
                x: 10
                y: diplay.height + 20
                color: "#c0c0c0"
                width: rootRect.width - x * 2
                height: 400

                CalculatorKey
                {
                    x: 0 * keysArea.width / 4
                    y: 0 * keysArea.height / 4
                }

                CalculatorKey
                {
                    x: 1 * keysArea.width / 4
                    y: 0 * keysArea.height / 4
                }

                CalculatorKey
                {
                    x: 2 * keysArea.width / 4
                    y: 0 * keysArea.height / 4
                }

                CalculatorKey
                {
                    x: 3 * keysArea.width / 4
                    y: 0 * keysArea.height / 4
                    color: "lightBlue"
                    CalculatorKeyText
                    {
                        text: "/"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "/"
                            // should add some logic
                        }
                    }
                }

                //--------------------------//

                CalculatorKey
                {
                    x: 0 * keysArea.width / 4
                    y: 1 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "7"
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "7"
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 1 * keysArea.width / 4
                    y: 1 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "8"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "8"
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 2 * keysArea.width / 4
                    y: 1 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "9"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "9"
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 3 * keysArea.width / 4
                    y: 1 * keysArea.height / 4
                    color: "lightBlue"
                    CalculatorKeyText
                    {
                        text: "*"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "*"
                            // should add some logic
                        }
                    }
                }

                //------------------//

                CalculatorKey
                {
                    x: 0 * keysArea.width / 4
                    y: 2 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "4"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "4"
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 1 * keysArea.width / 4
                    y: 2 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "5"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "5"
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 2 * keysArea.width / 4
                    y: 2 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "6"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "6"
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 3 * keysArea.width / 4
                    y: 2 * keysArea.height / 4
                    color: "lightBlue"
                    CalculatorKeyText
                    {
                        text: "-"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "-"
                            // should add some logic
                        }
                    }
                }

                //------------------//

                CalculatorKey
                {
                    x: 0 * keysArea.width / 4
                    y: 3 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "1"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "1"
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 1 * keysArea.width / 4
                    y: 3 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "2"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "2"
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 2 * keysArea.width / 4
                    y: 3 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "3"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "3"
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 3 * keysArea.width / 4
                    y: 3 * keysArea.height / 4
                    color: "lightBlue"
                    CalculatorKeyText
                    {
                        text: "+"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "+"
                            // should add some logic
                        }
                    }
                }

                //------------------//

                CalculatorKey
                {
                    x: 0 * keysArea.width / 4
                    y: 4 * keysArea.height / 4
                    color: "#d8bfd8"
                    CalculatorKeyText
                    {
                        text: "C"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text = ""
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 1 * keysArea.width / 4
                    y: 4 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "0"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "0"
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 2 * keysArea.width / 4
                    y: 4 * keysArea.height / 4
                    CalculatorKeyText
                    {
                        text: "."
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text += "."
                            // should add some logic
                        }
                    }
                }

                
                CalculatorKey
                {
                    x: 3 * keysArea.width / 4
                    y: 4 * keysArea.height / 4
                    color: "#d8bfd8"
                    CalculatorKeyText
                    {
                        text: "="
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            displayText.text = "Result??"
                            // should add some logic
                        }
                    }
                }

                //-------------------------------//

                // Tried with colums

//                Column
//                {
//                    x: 0; y: 0
//                    spacing: 0
//                    Repeater
//                    {
//                        model: ["7", "4", "1"]
//                        delegate: CalculatorKey
//                        {
//                            CalculatorKeyText
//                            {
//                                text: modelData
//                            }
//                        }
//                    }
//                }

//                Column
//                {
//                    x: keysArea.width / 4; y: 0
//                    spacing: 0
//                    Repeater
//                    {
//                        model: ["8", "5", "2", "0"]
//                        delegate: CalculatorKey
//                        {
//                            CalculatorKeyText
//                            {
//                                text: modelData
//                            }
//                        }
//                    }
//                }

//                Column
//                {
//                    x: 2 * keysArea.width / 4; y: 0
//                    spacing: 0
//                    Repeater
//                    {
//                        model: ["9", "6", "3"]
//                        delegate: CalculatorKey
//                        {
//                            CalculatorKeyText
//                            {
//                                text: modelData
//                            }
//                        }
//                    }
//                }

//                Column
//                {
//                    x: 3 * keysArea.width / 4; y: 0
//                    spacing: 0
//                    Repeater
//                    {
//                        model: ["/", "*", "-", "+"]
//                        delegate: CalculatorKey
//                        {
//                            color: "lightBlue"
//                            CalculatorKeyText
//                            {
//                                text: modelData
//                            }
//                        }
//                    }
//                }
//            }

            }

            Rectangle
            {
                id: info
                x: 10
                y: rootRect.height - height - 10
                color: "#f5f5f5"
                width: rootRect.width - x * 2
                height: 30

                Text
                {
                    width: info.width
                    height: info.height

                    text: "Calculator made by Andreea P. for training purposes"
                    font.pixelSize: 14
                    font.italic: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }
}
