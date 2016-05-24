//: Playground - noun: a place where people can play

import UIKit

protocol Vehicle {
    var speed: Double { get }
    var isMoving: Bool { get set }
    mutating func startMoving()
    mutating func stopMoving()
}

extension Vehicle {
    
    mutating func startMoving() {
        if isMoving == false {
            self.isMoving = true
        }
    }
    
    mutating func stopMoving() {
        if isMoving == true {
            self.isMoving = false
        } 
    }
}

protocol Racer: Vehicle {
    func race() -> Double
}

extension Racer {
    func race() -> Double {
        let time = speed / 1000
        return time
    }
}

class Mercedes: Vehicle {
    var speed: Double
    var isMoving: Bool
    
    init(speed: Double, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
}

class Mazda: Vehicle {
    var speed: Double
    var isMoving: Bool
    
    init(speed: Double, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
}

class RaceCar: Vehicle, Racer {
    var speed: Double
    var isMoving: Bool
    
    init(speed: Double, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
}

var cClass = Mercedes(speed: 40, isMoving: true)
var mazda3 = Mazda(speed: 0, isMoving: false)

print(cClass.isMoving)

cClass.stopMoving()
print(cClass.isMoving)

print(mazda3.isMoving)

mazda3.startMoving()
print(mazda3.isMoving)

var fastCar = RaceCar(speed: 280, isMoving: true)
print(fastCar.race())

