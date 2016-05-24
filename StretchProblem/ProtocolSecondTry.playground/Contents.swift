//: Playground - noun: a place where people can play

import UIKit

protocol Vehicle {
    var speed: Double { get }
    var isMoving: Bool { get set }
    
    mutating func startCar()
    mutating func stopCar()
}

extension Vehicle {
     mutating func startCar() {
        if isMoving == false {
            isMoving = true
            print("The vehicle is moving: \(isMoving)")
        }
    }
    mutating func stopCar() {
        if isMoving == true {
            isMoving = false
            print("The vehicle is moving: \(isMoving)")
        }
    }
}

class Mercedes: Vehicle {
    var speed: Double
    var isMoving: Bool
    var gasTank: Int
    
    init(speed: Double, isMoving: Bool, gasTank: Int) {
        self.speed = speed
        self.isMoving = isMoving
        self.gasTank = gasTank
    }
}

class F150: Vehicle {
    var speed: Double
    var isMoving: Bool
    var numberOfDoors: Double
    
    init(speed: Double, isMoving: Bool, numberOfDoors: Double) {
        self.speed = speed
        self.isMoving = isMoving
        self.numberOfDoors = numberOfDoors
    }
}

var cClass = Mercedes(speed: 40, isMoving: true, gasTank: 60)

print("The car is moving... \(cClass.isMoving)")

cClass.stopCar()

cClass.startCar()








