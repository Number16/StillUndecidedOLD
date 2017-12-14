//
//  ItemTableViewController.swift
//  StillUndecided
//
//  Created by 16 on 07/12/2017.
//  Copyright © 2017 Style RU Unofficial fan club. All rights reserved.
//

import UIKit

/*
 
 
 
 Секции:
 let section = TableViewSection()
 section.headerHeight = 44
 section.add(items: items)
 tableViewManager.add(section: section)
 UIView.setAnimationsEnabled(false)
 tableView.beginUpdates()
 let index = section.index
 tableViewManager.tableView.insertSections([index], with: .fade)
 tableView.endUpdates()
 UIView.setAnimationsEnabled(true)
 
 
 элемент
 var items: [Item] = []
 let item = Item()
 item.cellHeight = 98
 item.Name = .....
 items.append(item)
 дальше можно использовать items для секций
 */



class ItemTableViewController: UIViewController,TableViewManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [Item]()
    var months = [String]()
    var itemArray = [[Item]]()
    fileprivate var tableViewManager: TableViewManager!
    
    
    
    private func loadItems() {
        var item1 = Item()
        item1.ItemName = "League of Justice"
        item1.ItemDate = "21.11.2017"
        item1.ItemIcon = "movie_icon_white"
        item1.ItemCategory = "Movie"
        item1.ItemRating = "4"
        
        var item2 = Item()
        item2.ItemName = "War and Peace"
        item2.ItemDate = "11.12.2017"
        item2.ItemIcon = "book_icon_white"
        item2.ItemCategory = "Book"
        item2.ItemRating = "9"
        var item3 = Item()
        item3.ItemName = "McDonald's"
        item3.ItemDate = "22.12.2017"
        item3.ItemIcon = "cafe_icon_white"
        item3.ItemCategory = "Cafe"
        item3.ItemRating = "9"
        
        var item4 = Item()
        item4.ItemName = "League of Justice"
        item4.ItemDate = "21.11.2017"
        item4.ItemIcon = "movie_icon_white"
        item4.ItemCategory = "Movie"
        item4.ItemRating = "4"
        
        var item5 = Item()
        item5.ItemName = "War and Peace"
        item5.ItemDate = "11.12.2017"
        item5.ItemIcon = "book_icon_white"
        item5.ItemCategory = "Book"
        item5.ItemRating = "9"
        var item6 = Item()
        item6.ItemName = "McDonald's"
        item6.ItemDate = "22.12.2017"
        item6.ItemIcon = "cafe_icon_white"
        item6.ItemCategory = "Cafe"
        item6.ItemRating = "9"
        
        var item7 = Item()
        item7.ItemName = "League of Justice"
        item7.ItemDate = "21.11.2017"
        item7.ItemIcon = "movie_icon_white"
        item7.ItemCategory = "Movie"
        item7.ItemRating = "4"
    
        var item8 = Item()
        item8.ItemName = "War and Peace"
        item8.ItemDate = "11.12.2017"
        item8.ItemIcon = "book_icon_white"
        item8.ItemCategory = "Book"
        item8.ItemRating = "9"
        var item9 = Item()
        item9.ItemName = "McDonald's"
        item9.ItemDate = "22.12.2017"
        item9.ItemIcon = "cafe_icon_white"
        item9.ItemCategory = "Cafe"
        item9.ItemRating = "9"

        items += [item1, item2, item3, item4, item5, item6, item7, item8, item9]
        
        
        
        let section = TableViewSection()
        section.headerHeight = 50
        section.add(items: items)
        tableViewManager.add(section: section)
        tableView.reloadData()
        
    }
    
    func tableViewManager(_ manager: TableViewManager, headerViewForSection section: Int) -> UITableViewHeaderFooterView? {
        let headerView = manager.tableView.dequeueReusableHeaderFooterView(withIdentifier: "YetAnotherHeader") as! YetAnotherHeader
//                    let itemGroup = items[section]
//                    headerView.SectionHeader.text = itemGroup.ItemDate?.uppercased() ?? "ДРИСНЯ"
        headerView.nameLabel.text = "December"
                    return headerView
    }
    
//    @objc func tableViewManager(_ manager: TableViewManager, headerViewForSection section: Int) -> UITableViewHeaderFooterView? {
//            let headerView = manager.tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionHeader") as! TableSectionHeader
//            let itemGroup = items[section]
//            headerView.SectionHeader.text = itemGroup.ItemDate?.uppercased() ?? ""
//            return headerView
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        tableViewManager = TableViewManager(tableView: tableView)
        tableViewManager.delegate = self
        tableViewManager.register(nibModels: [Item.self])
        tableView.register(YetAnotherHeader.nib(), forHeaderFooterViewReuseIdentifier: "YetAnotherHeader")
        tableView.sectionHeaderHeight = 88
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 50
        
        loadItems()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //
    //        return Item.calculateMonths(items: items)
    //
    //    }
    
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return itemArray[section].count
    //    }
    
    
    
    //    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let headerView = tableView.dequeueReusableCell(withIdentifier: "TableSectionHeader") as? TableSectionHeader
    //        dump(months)
    //        headerView?.SectionHeader.text = months[section]
    //        return headerView
    //    }
    
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        // Table view cells are reused and should be dequeued using a cell identifier.
    //        let cellIdentifier = "ItemTableViewCell"
    //        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ItemTableViewCell else {
    //            fatalError("Drisnya happened")
    //        }
    //        print(indexPath.section,"thiiiiSDRISNYA ",indexPath.row)
    //        let item = itemArray[indexPath.section][indexPath.row]
    //
    //        cell.NameLabel.text = item.ItemName
    //        cell.CategoryLabel.text = item.ItemCategory
    //        cell.RatingLabel.text = String(item.ItemRating)
    //        cell.CategoryIcon.image = item.ItemIcon
    //        cell.StarIcon.image = item.ItemStarIcon
    //
    //
    //
    //
    //        return cell
    //    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    //    private func loadItems() {
    //        let photo1 = #imageLiteral(resourceName: "movie_icon_white")
    //        let photo2 = #imageLiteral(resourceName: "book_icon_white")
    //        let photo3 = #imageLiteral(resourceName: "cafe_icon_white")
    //
    //
    //        guard let item1 = Item(ItemName: "League of Justice", ItemRating: 4, ItemCategory: "Movie", ItemIcon: photo1, ItemStarIcon: #imageLiteral(resourceName: "star_icon_white"), ItemDate: "11.11.2017") else {
    //            fatalError("Unable to instantiate item")
    //        }
    //
    //        guard let item2 = Item(ItemName: "The Unbearable Lightness of Being", ItemRating: 10, ItemCategory: "Book", ItemIcon: photo2, ItemStarIcon: #imageLiteral(resourceName: "star_icon_white"), ItemDate: "15.12.2017") else {
    //            fatalError("Unable to instantiate item")
    //        }
    //
    //        guard let item3 = Item(ItemName: "Rozetka i Kofe", ItemRating: 4, ItemCategory: "Cafe", ItemIcon: photo3, ItemStarIcon: #imageLiteral(resourceName: "star_icon_white"), ItemDate: "18.12.2017") else {
    //            fatalError("Unable to instantiate item")
    //        }
    //
    //        items += [item1, item2, item3]
    //        print(Item.calculateMonths(items: items))
    //
    //        itemArray = Item.getArray(items: items)
    //        months = Item.monthList(items: items)
    //    }
    
}
