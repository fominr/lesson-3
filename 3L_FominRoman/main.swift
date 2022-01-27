

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
    
    mutating func autoStart (transmission: TransmissionStatus){
        
        if transmission == .drive {
            print ("Автозапуск двигателя невозможен, трансмиссия находится в режиме драйв. Установите в положение 'нейтраль' или Parking")
            
        } else {
            self.transmission = transmission
            self.engine = .start
            print("Автозапуск двигателя произведен")
        }
        
    }
    
}

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.


// операции с грузовым автомобилем

var car1 = TrunkCar(brand: "Kamaz", power: 300, year: 2019, bagageMax: 25_000, bagageWeight: 15_000, cargo: 5_000, engineStart: .stop, windowOpen: .close, bagage: .unload)
    
print(car1)
car1.bagage = .unload
car1.windowOpen = .open
car1.engine(engineStart: .start)
car1.operationBagage(operation: .unload, cargoBagage: 12_000)
car1.operationBagage(operation: .load, cargoBagage: 25_000)
print(car1)


