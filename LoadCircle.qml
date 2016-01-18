import QtQuick 2.3

Row{
    id: circle
    x: 0
    y: 0
    width: 400
    height: width
    rotation: 0
    property int circleWidth: 50
    property color circleColor: "red"
    property real progress: 0

    transformOrigin: Item.Center

    Item{
        width: circle.width/2
        height: circle.height
        clip: true

        Item{
            id: circlePart1
            width: circle.width/2
            height: circle.height
            clip: true
            rotation: 180.0 + ((progress > 180) ? (progress - 180) : 0)
            transformOrigin: Item.Right
            Rectangle{
                width: circle.width
                height: circle.height
                radius: width/2
                color: "transparent"
                border.color: circleColor
                border.width: circleWidth
                smooth: true
            }
        }
    }

    Item{
        width: circle.width/2
        height: circle.height
        clip: true
        Item{
            id: circlePart2
            width: circle.width/2
            height: circle.height
            clip: true
            rotation: 180.0 + ((progress > 180) ? 180 : progress)
            transformOrigin: Item.Left
            Rectangle{
                width: circle.width
                height: circle.height
                radius: width/2
                x:-width/2
                color: "transparent"
                border.color: circleColor
                border.width: circleWidth
                smooth: true
            }
        }
    }

    SequentialAnimation{
        id: initCircle
        running: true
        PropertyAnimation{ target: circle; property: "progress"; to:360; duration:5000/2 }
        PropertyAnimation{ target: circle; property: "progress"; to:0; duration:5000/2 }
        loops:Animation.Infinite
    }
}



