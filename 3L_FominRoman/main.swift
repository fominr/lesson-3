

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

enum TransmissionStatus {   // состояние трансмиссии
    case parking
    case neutral
    case drive
    }


//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
struct TrunkCar {
    let brand: String
    let power: Int
    let year: Int
    let bagageMax: Int
    var bagageWeight: Int
    var cargo: Int
    var engineStart: EngineStatus
    var windowOpen: WindowSatus
    var bagage: BagageStatus
}

struct  sportCar{
        let brand: String
        let year: Int
        let weightCar: Int  // вес авто
        let weightTotal: Int    // общий вес: авто + груз
        var weightBagage: Int   // вес груза
        let window: WindowSatus
        var engine: EngineStatus
        var transmission: TransmissionStatus
}
