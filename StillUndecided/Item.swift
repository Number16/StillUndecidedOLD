//
//  Item.swift
//  StillUndecided
//
//  Created by 16 on 07/12/2017.
//  Copyright © 2017 Style RU Unofficial fan club. All rights reserved.
//

import UIKit
final class Item: NSObject, CellViewModel {
    
    
    
    var enabled: Bool = false
    var cellHeight: CGFloat = 56
    var section: TableViewSection? = nil
    var selectionHandler: ((Item) -> Void)? = nil
    
    
    typealias CellType = ItemTableViewCell
    
    func setup(cell: ItemTableViewCell) {
        cell.NameLabel.text = ItemName ?? ""
        cell.RatingLabel.text = ItemRating ?? ""
        cell.CategoryIcon.image = UIImage(named: ItemIcon ?? "")
        cell.CategoryLabel.text = ItemCategory ?? ""
    }
    var ItemName: String?
    var ItemRating: String?
    var ItemCategory: String?
    var ItemIcon: String?
    var ItemDate: String?
    var ItemMonth: String?
//    {
//        return getMonthText(month: getMonth())
//    }
    
    
//
//    init(ItemName: String, ItemRating: Int, ItemCategory: String, ItemIcon: UIImage?, ItemStarIcon: UIImage?, ItemDate: String) {
//        self.ItemName = ItemName
//        self.ItemRating = ItemRating
//        self.ItemCategory = ItemCategory
//        self.ItemIcon = ItemIcon
//        self.ItemStarIcon = ItemStarIcon
//        self.ItemDate = ItemDate
//    }
    
    
    func getMonth() -> String {
        let index = ItemDate?.index((ItemDate?.startIndex)!, offsetBy: 3)
        let month = String(describing: ItemDate?.substring(from: index!))
        return month
        
    }
    
    func getMonthText(month: String) -> String {
        print(month)
        let temp = String(month.substring(to: month.index(month.startIndex, offsetBy: 2)))
        var monthText = String()
        
        if(temp=="01") {
            monthText = "January"
        }
        
        if(temp=="02") {
            monthText = "February"
        }
        
        if(temp=="03") {
            monthText = "March"
        }
        
        if(temp=="04") {
            monthText = "April"
        }
        
        if(temp=="05") {
            monthText = "May"
        }
        
        if(temp=="06") {
            monthText = "June"
        }
        
        if(temp=="07") {
            monthText = "July"
        }
        
        if(temp=="08") {
            monthText = "August"
        }
        
        if(temp=="09") {
            monthText = "September"
        }
        
        if(temp=="10") {
            monthText = "October"
        }
        
        if(temp=="11") {
            monthText = "November"
        }
        
        if(temp=="12") {
            monthText = "December"
        }
        return monthText
        
    }
    
    static func calculateMonths(items: [Item]) -> Int {
        var months = [String]()
        for i in items {
            months.append(i.getMonth())
        }
        var array: [String] = []
        months.map { if !array.contains($0) {
            array.append($0)
            }
        }
        
        return array.count;
    }
    
    static func monthList(items: [Item]) -> [String]{
        var months = [String]()
        for i in items {
            if (!months.contains(i.getMonth())) {
                months.append(i.getMonth())
            }
        }
        return months
    }
    
    
    static func getArray(items: [Item]) -> [[Item]] {
        var array = [[Item]]()
        var months = monthList(items: items)
        
        for m in months {
            var temp = [Item]()
            for i in items {
                if m == i.getMonth() {
                    temp.append(i)
                    
                }
            }
            array.append(temp)
        }
        dump(array)
        return array
    }
}

class YetAnotherHeader: UITableViewHeaderFooterView {
    override func awakeFromNib() {
        super.awakeFromNib()
        let view = UIView()
        backgroundView = view
    }
    static func nib() -> UINib {
        return UINib(nibName: "YetAnotherHeader", bundle: nil)
    }
    @IBOutlet weak var nameLabel: UILabel!
}




