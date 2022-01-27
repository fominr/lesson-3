

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
    
    // включить- выключить двигатель
    mutating func engine (engineStart: EngineStatus ) {
        self.engineStart = engineStart
    }
    
    // загрузить или выгрузить  количество кг в авто
    mutating func operationBagage (operation: BagageStatus, cargoBagage: Int ) {
      
        switch operation {
        case .load: do {
            if (cargoBagage + self.bagageWeight) > self.bagageMax {
                print("Операция отменена. Нельзя \(cargoBagage) кг загрузить в авто, будет перегруз.")
            } else {
                self.bagageWeight = self.bagageWeight + cargoBagage
                self.cargo = cargoBagage
                print("В автомобиль загрузили \(cargoBagage) кг")
            }
        }
        case .unload: do {
            if (self.bagageWeight) < cargoBagage {
                print("нельзя \(cargoBagage) кг выгрузить из авто")
            } else {
                self.bagageWeight = self.bagageWeight - cargoBagage
                self.cargo = cargoBagage
                print("Из автомобиля выгрузили \(cargoBagage) кг")
            }
        }
        }
    }
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

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

