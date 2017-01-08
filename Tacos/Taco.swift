//
//  Taco.swift
//  Tacos
//
//  Created by shashank kannam on 1/7/17.
//  Copyright © 2017 shashank kannam. All rights reserved.
//

import Foundation


enum TacoShell: Int{
    case Flour = 1
    case Corn = 2
}

enum TacoProtein: String{
    case Chicken = "Chicken"
    case Beef = "Beef"
    case Brisket = "Brisket"
    case Fish = "Fish"
}

enum TacoCondiment: Int{
    case Loaded = 1
    case Plain = 2
}

struct Taco{
    private var _id:Int!
    private var _condimentId:TacoCondiment!
    private var _shellId:TacoShell!
    private var _proteinId:TacoProtein!
    private var _productName:String!
  
    var id: Int{
        return _id
    }
    
    var condimentId: TacoCondiment{
        return _condimentId
    }
    
    var shellId: TacoShell{
        return _shellId
    }
    
    var proteinId:TacoProtein{
        return _proteinId
    }
    
    var productname:String{
        return _productName
    }
    
    init(id:Int, productName:String, shellId:Int, proteinId:Int, condimentId:Int) {
        _id = id
        _productName = productName
       
        switch shellId{
        case 2: _shellId = TacoShell.Flour
        default: _shellId = TacoShell.Corn
        }
        
        switch condimentId{
        case 2: _condimentId = TacoCondiment.Plain
        default: _condimentId = TacoCondiment.Loaded
        }
        
        switch proteinId{
        case 2: _proteinId = TacoProtein.Chicken
        case 1: _proteinId = TacoProtein.Beef
        case 3: _proteinId = TacoProtein.Brisket
        default: _proteinId = TacoProtein.Fish
        }
    }
    
}
