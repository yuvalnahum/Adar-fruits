//
//  Fruit.swift
//  פירות אדר
//
//  Created by יובל נחום on 25.6.2018.
//  Copyright © 2018 יובל נחום. All rights reserved.
//

import UIKit

struct Fruit: Equatable {
    var name:String
    var checked: Bool
    static func == (f: Fruit, f1: Fruit)->Bool{
        return f.name == f1.name
    }
}
