//
//  ViewController.swift
//  ReusableLineGraph
//
//  Created by Isaac Annan on 12/09/2019.
//  Copyright © 2019 Isaac Annan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var specialView: PLineChartView!
    @IBOutlet weak var anotherSpecialView: PLineChartView!
    @IBOutlet weak var myView: PLineChartView!
    
    let x: Array<Double> = [1,2,3,4,5]
    let y: Array<Double> = [6,8,4,5,9]
    
    let array1: Array<Double> = [1,2,3,4,5,6,7,6,9]
    let array2: Array<Double> = [9,90,100,7,2,5,7000000000000000000000000000000,0,43]
    
    let arr1: Array<Double> = [1,2,3,4,5,6,7,6,9]
    let arr2: Array<Double> = [9,90,100,7,2,5,7000000000000000000000000000000,0,43]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        specialView.setLineChartView(name: x, value: y, lineWidth: 3, fillColor: UIColor.yellow, lineColor: [UIColor.red])
//        specialView.contentView.customizeLineChartView()
        
         myView.setLineChartView(name: arr1, value: arr2, lineWidth: 3, fillColor: UIColor.lightGray, lineColor: [UIColor.magenta])
        
        anotherSpecialView.setLineChartView(name: array1, value: array2, lineWidth: 2, fillColor: UIColor.lightGray, lineColor: [UIColor.magenta])
//        anotherSpecialView.contentView.customizeLineChartView()
        //specialView.status(mArray: y)
        
    }


}

