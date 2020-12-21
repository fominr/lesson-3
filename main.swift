//
//  main.swift
//  lesson-3
//
//  Created by Rom on 20.12.2020.
//

/*
 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.
 */

import Foundation

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

enum TransmissionStatus {   // состояние трансмиссии
    case parking
    case neutral
    case drive
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


var car1 = TrunkCar(brand: "Kamaz", power: 300, year: 2019, bagageMax: 25_000, bagageWeight: 15_000, cargo: 5_000, engineStart: .stop, windowOpen: .close, bagage: .unload)
    
print(car1)
car1.bagage = .unload
car1.windowOpen = .open
car1.engine(engineStart: .start)
car1.operationBagage(operation: .unload, cargoBagage: 12_000)
car1.operationBagage(operation: .load, cargoBagage: 25_000)
print(car1)

var car2 = sportCar(brand: "Audi", year: 2020, weightCar: 1300, weightTotal: 1900, weightBagage: 600, window: .close, engine: .stop, transmission: .parking)

print (car2)
car2.autoStart(transmission: .drive)
car2.autoStart(transmission: .parking)
print (car2)

//коммент




