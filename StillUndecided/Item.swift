//
//  Item.swift
//  StillUndecided
//
//  Created by 16 on 07/12/2017.
//  Copyright © 2017 Style RU Unofficial fan club. All rights reserved.
//

import UIKit

extension String {
    subscript(value: PartialRangeUpTo<Int>) -> String {
        get {
            return String(self[..<index(startIndex, offsetBy: value.upperBound)])
        }
    }
    
    subscript(value: PartialRangeThrough<Int>) -> String {
        get {
            return String(self[...index(startIndex, offsetBy: value.upperBound)])
        }
    }
    
    subscript(value: PartialRangeFrom<Int>) -> String {
        get {
            return String(self[index(startIndex, offsetBy: value.lowerBound)...])
        }
    }
}

struct ItemData: Codable {
    var ItemName: String?
    var ItemRating: String?
    var ItemCategory: String?
    var ItemIcon: String?
    var ItemDate: String?
    
    func convertToDictionary() -> [String : Any] {
        let dic: [String: Any] = ["ItemName":self.ItemName, "ItemRating":self.ItemRating, "ItemCategory":self.ItemCategory, "ItemIcon":self.ItemIcon, "ItemDate":self.ItemDate]
        return dic
    }
    
    init(ItemName: String?, ItemRating: String?, ItemCategory: String?, ItemIcon: String?, ItemDate: String?) {
        self.ItemName = ItemName
        self.ItemRating = ItemRating
        self.ItemCategory = ItemCategory
        self.ItemIcon = ItemIcon
        self.ItemDate = ItemDate

    }
    
    init() {
        self.ItemName = nil
        self.ItemRating = nil
        self.ItemCategory = nil
        self.ItemIcon = nil
        self.ItemDate = nil
    }
}





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
    
    
    
    
    
    static func getMonthText(date: String) -> String {
        let temp = (date[3...])[...1]
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
    
    func getMonth() -> String{
        return (ItemDate![3...])[...1]
    }
    
    func getYear() -> String{
        return ItemDate![6...]
    }
    
    static func isNewer(item1: Item, item2: Item) -> Bool {
        
        let date1 = item1.ItemDate
        let date2 = item2.ItemDate
        
        let day1:Int = (Int(date1![...1]))!
        let day2:Int = (Int(date2![...1]))!
        
        
        let year1:Int = (Int(date1![6...]))!
        let year2:Int = (Int(date2![6...]))!
        
        let month1:Int = (Int((date1![3...])[...1]))!
        let month2:Int = (Int((date2![3...])[...1]))!
        
        
        if (year1 != year2) {
            return year1>year2
        }
        else if (month1 != month2) {
            return month1>month2
        }
        else if (day1 != day2) {
            return day1>day2
        }
        else {
            return false
        }
        
    }
    
    
    
    /*
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
     */
    /*
     static func monthList(items: [Item]) -> [String]{
     var months = [String]()
     for i in items {
     if (!months.contains(i.getMonth())) {
     months.append(i.getMonth())
     }
     }
     return months
     }
     */
    
    
    /*
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
     
     return array
     }
     */
}


class YetAnotherHeader: UITableViewHeaderFooterView {
    override func awakeFromNib() {
        super.awakeFromNib()
        let view = UIView()
        view.backgroundColor = UIColor(red:0.11, green:0.11, blue:0.11, alpha:1.0)
        backgroundView = view
    }
    static func nib() -> UINib {
        return UINib(nibName: "YetAnotherHeader", bundle: nil)
    }
    @IBOutlet weak var nameLabel: UILabel!
}
