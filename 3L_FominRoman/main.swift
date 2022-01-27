//
//  main.swift
//  3L_FominRoman
//
//  Created by Rom on 27.01.2022.
//

import Foundation

// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

enum EngineStatus {  // состояние двигателя
    case stop
    case start
    }

enum WindowSatus {   // состояние окон.
    case open
    case close
}

enum BagageStatus {  // погрузка или разгрузка авто
    case load
    case unload
}


//struct TrunkCar {
//    let brand: String
//    let power: Int
//    let year: Int
//    let bagageMax: Int
//    var bagageWeight: Int
//    var cargo: Int
//    var engineStart: EngineStatus
//    var windowOpen: WindowSatus
//    var bagage: BagageStatus
