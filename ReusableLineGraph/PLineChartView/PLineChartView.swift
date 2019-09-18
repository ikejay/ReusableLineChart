//
//  PLineChartView.swift
//  ReusableLineGraph
//
//  Created by Isaac Annan on 12/09/2019.
//  Copyright © 2019 Isaac Annan. All rights reserved.
//

import UIKit
import Charts

class PLineChartView: UIView {
    @IBOutlet var contentView: LineChartView!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        Bundle.main.loadNibNamed("PLineChartView", owner: self, options: nil)
        self.addSubview(self.contentView)
        
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.contentView.bindFrameToSuperviewBounds()
        
//        customizeLineChartView()
        scaleTextSize()
        
        
        let constraint = NSLayoutConstraint(item: stackView!,
                                            attribute: .centerY,
                                            relatedBy: .equal,
                                            toItem: contentView,
                                            attribute: .bottom,
                                            multiplier: 3.5/5,
                                            constant: 0)
        constraint.isActive = true
      
        
    }
    
    func setLineChartView(name: [Double], value: [Double], lineWidth: CGFloat, fillColor: UIColor, lineColor: [UIColor]){
        let Maximum: Double = value.max() ?? 0.0
        let mMaximum:Double = (Maximum )/2
        
        var lineArray: [ChartDataEntry] = []
        
        for i in 0..<name.count {
            let data: ChartDataEntry = ChartDataEntry(x: Double(i) , y: mMaximum + value[i])
            lineArray.append(data)
        }
        
        let linedataset: LineChartDataSet = LineChartDataSet(entries: lineArray, label: "Succianan Grey")
        linedataset.drawCirclesEnabled = false
        linedataset.mode = .cubicBezier
        linedataset.lineWidth = lineWidth
        linedataset.fill = Fill.fillWithColor(fillColor)
        linedataset.drawFilledEnabled = true
        linedataset.colors = lineColor
        
        let mMinimum: Double = value.min() ?? 0.0
        
        
        contentView.leftAxis.enabled = false
        contentView.rightAxis.enabled = false
        contentView.xAxis.enabled = false
        contentView.xAxis.drawGridLinesEnabled = false
        contentView.legend.enabled = false
        contentView.pinchZoomEnabled = false
        contentView.doubleTapToZoomEnabled = false
        contentView.scaleXEnabled = false
        contentView.scaleYEnabled = false
        contentView.leftAxis.axisMinimum = mMinimum - (mMaximum/2)
        
        
        
        let lineData: LineChartData = LineChartData(dataSet: linedataset)
        contentView.data = lineData
        
        lineData.setDrawValues(false)
        
        status(mArray: value)
    }
    
    func status(mArray: Array<Double>){
        
        if (Int(mArray[mArray.count - 1]) > Int(mArray[mArray.count - 2])) {
             statusImage.image = UIImage(named: "arrow2")
        }
        
        else{
            statusImage.image = UIImage(named: "arrrow")
        }
    }
    
    func scaleTextSize(){
        
        
        if (self.frame.width <= 150){
            amountLabel.font = UIFont(name: amountLabel.font.fontName, size: 8)
            percentage.font = UIFont(name: percentage.font.fontName, size: 8)
            //statusImage.frame.size = CGSize(width: 10, height: 10)
        
        }
        
        else
            if(self.frame.width > 250){
                amountLabel.font = UIFont(name: amountLabel.font.fontName, size: 20)
                percentage.font = UIFont(name: percentage.font.fontName, size: 20)
               // statusImage.frame.size = CGSize(width: 10.0, height: 10.0)
        }
        
    }
    


}

extension LineChartView {


}

extension UIView {
    
    /// Adds constraints to this `UIView` instances `superview` object to make sure this always has the same size as the superview.
    /// Please note that this has no effect if its `superview` is `nil` – add this `UIView` instance as a subview before calling this.
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true
        
    }
}




