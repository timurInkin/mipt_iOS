//
//  AreaDataController.swift
//  mipt_iOS_app
//
//  Created by ms30 on 18.12.21.
//

import Foundation
enum AreaModificationTask {
    case create
    case edit
    case delete
}

protocol AreaDataControllerDelegate {
    func areaDataSourceChanged(dataSource:[Area]?, error:Error?)
}
class AreaDataController {
    var areas:[Area]?
    var delegate:AreaDataControllerDelegate?
    
    func getAreas() {
        self.delegate?.areaDataSourceChanged(dataSource: self.areas, error: nil)
    }
    func modify(area:Area, task:AreaModificationTask) {
        if var areas = self.areas {
            switch task {
            case .create:
                areas.append(area)
                break
            case .edit:
                if let index = areas.index(where: {$0 == area}) {
                    areas[index] = area
                }
                break
            case .delete:
                if let index = areas.index(where: {$0 == area}) {
                    areas.remove(at: index)
                }
                break
            }
            self.areas = areas
            self.delegate?.areaDataSourceChanged(dataSource: self.areas, error: nil)
        }
    }
}
