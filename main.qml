import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window
{
    id: myWindow
    visible: true
    width: 480
    height: isDec ? 750 : 840
    title: qsTr("Calculator")

    property bool isDec: true

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
                    focus: true
                    Keys.onEnterPressed:
                    {
                        displayText.text = "Result??"
                        // should add some logic
                    }
                }
            }

            Rectangle
            {
                id: settingsArea
                x: 10
                y: diplay.height + 20

                width: rootRect.width - x * 2
                height: 40

                color: "#f5f5f5"

                ButtonGroup
                {
                    id: settingsRadioBtnGroup
                    onClicked:
                    {
                        console.log("clicked:", button.text)
                        myWindow.isDec = dec.checked
                        // keysArea.visible = dec.checked ? true : false
                    }
                }


                Row {
                    spacing: 5
                    Label {
                        x: 10; y: 10
                        height: settingsArea.height - 20
                        width: settingsArea.width / 2
                        text: qsTr("Choose the base:")
                        font.pixelSize: 16
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignTop
                        color: "black"
                    }

                    RadioButton {
                        id: dec
                        checked: true
                        text: qsTr("DEC")
                        ButtonGroup.group: settingsRadioBtnGroup
                    }

                    RadioButton {
                        id: hex
                        text: qsTr("HEX")
                        ButtonGroup.group: settingsRadioBtnGroup
                    }
                }
            }

            // ------------------------------------ //

            Rectangle
            {
                id: keysArea
                x: 10
                y: diplay.height + settingsArea.height + 40
                color: "#c0c0c0"
                width: rootRect.width - x * 2
                height: myWindow.isDec ? 450 : 540
                clip: true

                property int nrKeysOnColumn: myWindow.isDec ? 5 : 6
                property int nrKeysOnRow: 4

                property int keyWidth: keysArea.width / keysArea.nrKeysOnRow
                property int keyHeight: keysArea.height / keysArea.nrKeysOnColumn

                // ---- 3 free keys -----


                Row
                {
                    x: 0; y: 0
                    spacing: 0
                    Repeater
                    {
                        model: 3
                        delegate: CalculatorKey
                        {
                        }
                    }

                    // visible: myWindow.isDec ? true : false
                    visible: false
                }

                //-------------------------------//

                // ---- ONLY FOR HEXA ---------- //

                Grid
                {
                    x: 0; y: 0
                    rows: 2; columns: 3;

                    Repeater
                    {
                        model: ["A", "B", "C", "D", "E", "F"]
                        CalculatorKey
                        {
                             CalculatorKeyText
                             {
                                   text: modelData
                             }
                             property var keyBaseColor: "white"
                             property var keyColorOnPress: "#dcdcdc"

                             CalculatorKeyMouse
                             {
                                   onClicked:
                                   {
                                       isplayText.text += modelData
                                        // should add some logic
                                   }
                             }
                         }
                    }
                    visible: myWindow.isDec ? false : true
                 }

                // ----------------------------- //

                // DIGITS

                Column
                {
                    x: 0 * keysArea.keyWidth
                    y: (myWindow.isDec ? 1 : 2) * keysArea.keyHeight
                    spacing: 0
                    Repeater
                    {
                        model: ["7", "4", "1"]
                        delegate: CalculatorKey
                        {
                            CalculatorKeyText
                            {
                                text: modelData
                            }
                            property var keyBaseColor: "white"
                            property var keyColorOnPress: "#dcdcdc"

                            CalculatorKeyMouse
                            {
                                onClicked:
                                {
                                    displayText.text += modelData
                                    // should add some logic
                                }
                            }
                        }
                    }
                }

                Column
                {
                    x: 1 * keysArea.keyWidth
                    y: (myWindow.isDec ? 1 : 2) * keysArea.keyHeight
                    spacing: 0
                    Repeater
                    {
                        model: ["8", "5", "2", "0"]
                        delegate: CalculatorKey
                        {
                            CalculatorKeyText
                            {
                                text: modelData
                            }

                            property var keyBaseColor: "white"
                            property var keyColorOnPress: "#dcdcdc"

                            CalculatorKeyMouse
                            {
                                onClicked:
                                {
                                    displayText.text += modelData
                                    // should add some logic
                                }
                            }
                        }
                    }
                }

                Column
                {
                    x: 2 * keysArea.keyWidth
                    y: (myWindow.isDec ? 1 : 2) * keysArea.keyHeight
                    spacing: 0
                    Repeater
                    {
                        model: ["9", "6", "3"]
                        delegate: CalculatorKey
                        {
                            CalculatorKeyText
                            {
                                text: modelData
                            }

                            property var keyBaseColor: "white"
                            property var keyColorOnPress: "#dcdcdc"

                            CalculatorKeyMouse
                            {
                                onClicked:
                                {
                                    displayText.text += modelData
                                    // should add some logic
                                }
                            }
                        }
                    }
                }

                // OPERATORS

                Column
                {
                    x: 3 * keysArea.keyWidth
                    y: (myWindow.isDec ? 0 : 1) * keysArea.keyHeight
                    spacing: 0
                    Repeater
                    {
                        model: ["/", "*", "-", "+"]
                        delegate: CalculatorKey
                        {
                            property var keyBaseColor: "lightBlue"
                            property var keyColorOnPress: "#00ced1"
                            color: keyBaseColor
                            CalculatorKeyText
                            {
                                text: modelData
                            }
                            CalculatorKeyMouse
                            {
                                onClicked:
                                {
                                    displayText.text += modelData
                                    // should add some logic for opertors
                                }
                            }
                        }
                    }
                }

                // SPECIAL KEYS

                CalculatorKey
                {
                    x: 0 * keysArea.keyWidth
                    y: (myWindow.isDec ? 4 : 5) * keysArea.keyHeight
                    property var keyBaseColor: "#d8bfd8"
                    property var keyColorOnPress: "#ff69b4"
                    color: keyBaseColor
                    CalculatorKeyText
                    {
                        text: "C"
                    }
                    CalculatorKeyMouse
                    {
                        onClicked:
                        {
                            displayText.text = ""
                            // should add some logic
                        }
                    }
                }

                CalculatorKey
                {
                    x: 2 * keysArea.keyWidth
                    y: (myWindow.isDec ? 4 : 5) * keysArea.keyHeight
                    CalculatorKeyText
                    {
                        text: "."
                    }
                    property var keyBaseColor: "white"
                    property var keyColorOnPress: "#dcdcdc"

                    CalculatorKeyMouse
                    {
                        onClicked:
                        {
                            displayText.text += "."
                            // should add some logic
                        }
                    }
                }


                CalculatorKey
                {
                    x: 3 * keysArea.keyWidth
                    y: (myWindow.isDec ? 4 : 5) * keysArea.keyHeight
                    property var keyBaseColor: "#d8bfd8"
                    property var keyColorOnPress: "#ff69b4"
                    color: keyBaseColor
                    CalculatorKeyText
                    {
                        text: "="
                    }
                    CalculatorKeyMouse
                    {
                        onClicked:
                        {
                            displayText.text = "Result??"
                            // should add some logic
                        }
                    }
                }
            }


            // --------------------------------------------------- //

            // FOOTER

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

            // ------------ //
        }
    }
}
