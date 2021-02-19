import Foundation

let ball = OvalShape(width: 40, height: 40)

var barriers: [Shape] = []
let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]

let funnel = PolygonShape(points: funnelPoints)

var targets: [Shape] = []

/*
The setup() function is called once when the app launches. Without it, your app won't compile.
Use it to set up and start your app.

You can create as many other functions as you want, and declare variables and constants,
at the top level of the file (outside any function). You can't write any other kind of code,
for example if statements and for loops, at the top level; they have to be written inside
of a function.
*/

fileprivate func setupBall() {
    ball.position = Point(x: 250, y: 400)
    ball.hasPhysics = true
    ball.fillColor = .blue
    scene.add(ball)
    ball.onCollision = ballCollided(with:)
    ball.isDraggable = false
    scene.trackShape(ball)
    ball.onExitedScene = ballExitedScene
    ball.onTapped = resetGame
    ball.bounciness = 0.6
}

func ballCollided(with otherShape: Shape){
    if otherShape.name != "target" {return}
    
    otherShape.fillColor = .green
}

fileprivate func addBarrier(at position: Point, width: Double, height: Double, angle: Double) {
    let barrierPoints = [
        Point(x: 0, y: 0),
        Point(x: 0, y: height),
        Point(x: width, y: height),
        Point(x: width, y: 0)
    ]
    
    let barrier = PolygonShape(points: barrierPoints)
    barriers.append(barrier)
    barrier.position = position
    barrier.hasPhysics = true
    scene.add(barrier)
    barrier.isImmobile = true
    barrier.fillColor = .brown
    barrier.angle = angle
}

fileprivate func setupFunnel() {
    funnel.position = Point(x: 200, y: scene.height - 25)
    scene.add(funnel)
    funnel.onTapped = dropBall
    funnel.fillColor = .gray
    funnel.isDraggable = false
}

fileprivate func addTarget(at position: Point) {
    let targetPoints = [
    Point(x: 10, y: 0),
        Point(x: 0, y: 10),
        Point(x: 10, y: 20),
        Point(x: 20, y: 10)
    ]
    let target = PolygonShape(points: targetPoints)
    targets.append(target)
    target.position = position
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = false
    target.fillColor = .yellow
    target.name = "target"
    scene.add(target)
    //target.isDraggable = false
}

func setup() {
    setupBall()
    addBarrier(at: Point(x: 300, y: 250), width: 70, height: 30, angle: 0.1)
    addBarrier(at: Point(x: 100, y: 250), width: 80, height: 25, angle: -0.2)
    addBarrier(at: Point(x: 300, y: 150), width: 90, height: 20, angle: -0.1)
    addBarrier(at: Point(x: 100, y: 150), width: 100, height: 15, angle: 0.2)
    
    setupFunnel()
    addTarget(at: Point(x: 188, y: 604))
    addTarget(at: Point(x: 300, y: 525))
    addTarget(at: Point(x: 212, y: 388))
    addTarget(at: Point(x: 90, y: 345))
    addTarget(at: Point(x: 38, y: 275))
    addTarget(at: Point(x: 148, y: 200))
    resetGame()
    scene.onShapeMoved = printPosition(of:)
}

func dropBall() {
    ball.position = funnel.position
    ball.stopAllMotion()
    for barrier in barriers {
        barrier.isDraggable = false
    }
    for target in targets {
        target.fillColor = .yellow
    }
}

func alertDismissed() {
    
}

func ballExitedScene() {
    for barrier in barriers {
    barrier.isDraggable = true
    }
    var hitTargets = 0
    for target in targets {
        if target.fillColor == .green {
            hitTargets += 1
        }
    }
    if hitTargets == targets.count {
        scene.presentAlert(text: "You won!", completion: alertDismissed)
    }
    
}

func resetGame() {
    ball.position = Point(x: 0, y: -80)
}

func printPosition (of shape: Shape) {
    print(shape.position)
}
