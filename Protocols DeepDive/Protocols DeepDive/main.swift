protocol CanFly {
    func fly()
}

class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("Sooo many eggs")
        }
    }
}


class Eagle: Bird, CanFly {
    func fly() {
        print("Flying eagle bird.")
    }
    
    func soar() {
        print("Sooo soars")
    }
}

class Penguin: Bird {
    func swim() {
        print("Sooo water")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
    func fly() {
        print("Airplane flies!")
    }
}

let myEagle = Eagle()
let myAirplane = Airplane()
let myPenguin = Penguin()
let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)
museum.flyingDemo(flyingObject: myAirplane)
