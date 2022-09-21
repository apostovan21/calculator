import QtQuick 2.0

Rectangle
{
    id: key
    width: keysArea.width / 4
    height: keysArea.height / keysArea.nrKeysOnColumn

    border.width: 1
    border.color: "black"
    radius: 4
}
