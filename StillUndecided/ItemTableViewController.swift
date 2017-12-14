//
//  ItemTableViewController.swift
//  StillUndecided
//
//  Created by 16 on 07/12/2017.
//  Copyright © 2017 Style RU Unofficial fan club. All rights reserved.
//

import UIKit
import MaterialComponents

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
    var itemsSorted = [[Item]]()
    var itemDataArray = [ItemData]()
    fileprivate var tableViewManager: TableViewManager!
    
    var headerArray = [String]()
    
    func classToStruct(items: [Item]) -> [ItemData]{
        var data = [ItemData]()
        var dataItem = ItemData()
        for item in items {
            dataItem = ItemData()
            dataItem.ItemName = item.ItemName
            dataItem.ItemRating = item.ItemRating
            dataItem.ItemCategory = item.ItemCategory
            dataItem.ItemIcon = item.ItemIcon
            dataItem.ItemDate = item.ItemDate
            data.append(dataItem)
        }
        return data
    }
    
    
    func structToClass(data: [ItemData]) -> [Item]{
        var items = [Item]()
        var item = Item()
        for dataItem in data {
            item = Item()
            item.ItemName = dataItem.ItemName
            item.ItemRating = dataItem.ItemRating
            item.ItemCategory = dataItem.ItemCategory
            item.ItemIcon = dataItem.ItemIcon
            item.ItemDate = dataItem.ItemDate
            items.append(item)
        }

        return items
    }
    
    private func startLoadItems() {
       
        
        
        
        
        var item1 = Item()
        item1.ItemName = "League of Justice"
        item1.ItemDate = "21.11.2017"
        item1.ItemIcon = "movie_icon_white"
        item1.ItemCategory = "Movie"
        item1.ItemRating = "4"
        
        items.append(item1)
        
        
        item1 = Item()
        item1.ItemName = "War and Peace"
        item1.ItemDate = "11.12.2017"
        item1.ItemIcon = "book_icon_white"
        item1.ItemCategory = "Book"
        item1.ItemRating = "9"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "McDonald's"
        item1.ItemDate = "22.12.2017"
        item1.ItemIcon = "cafe_icon_white"
        item1.ItemCategory = "Cafe"
        item1.ItemRating = "9"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "KFC"
        item1.ItemDate = "22.10.2017"
        item1.ItemIcon = "cafe_icon_white"
        item1.ItemCategory = "Cafe"
        item1.ItemRating = "8"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "BurgerKing"
        item1.ItemDate = "22.10.2017"
        item1.ItemIcon = "cafe_icon_white"
        item1.ItemCategory = "Cafe"
        item1.ItemRating = "7"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "Starbucks"
        item1.ItemDate = "22.10.2017"
        item1.ItemIcon = "cafe_icon_white"
        item1.ItemCategory = "Cafe"
        item1.ItemRating = "8"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "Star Wars VIII"
        item1.ItemDate = "15.12.2017"
        item1.ItemIcon = "movie_icon_white"
        item1.ItemCategory = "Movie"
        item1.ItemRating = "10"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "Spider Man: Homecoming"
        item1.ItemDate = "06.07.2017"
        item1.ItemIcon = "movie_icon_white"
        item1.ItemCategory = "Movie"
        item1.ItemRating = "10"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "Republic (Plato)"
        item1.ItemDate = "19.08.2017"
        item1.ItemIcon = "book_icon_white"
        item1.ItemCategory = "Book"
        item1.ItemRating = "10"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "The Godfather"
        item1.ItemDate = "15.03.1972"
        item1.ItemIcon = "movie_icon_white"
        item1.ItemCategory = "Movie"
        item1.ItemRating = "9"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "Citizen Kane"
        item1.ItemDate = "01.05.1941"
        item1.ItemIcon = "movie_icon_white"
        item1.ItemCategory = "Movie"
        item1.ItemRating = "10"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "Slaughterhouse-Five"
        item1.ItemDate = "11.12.2017"
        item1.ItemIcon = "book_icon_white"
        item1.ItemCategory = "Book"
        item1.ItemRating = "9"
        
        items.append(item1)
        
        item1 = Item()
        item1.ItemName = "Thinking, Fast and Slow"
        item1.ItemDate = "25.10.2011"
        item1.ItemIcon = "book_icon_white"
        item1.ItemCategory = "Book"
        item1.ItemRating = "9"
        
        items.append(item1)
        
        //definng array
        var itemDataArray = classToStruct(items: items)

        
        //serealizing
        let itemDataDic = itemDataArray.map { $0.convertToDictionary() }

        var str = String()
        
        if let itemData = try? JSONSerialization.data(withJSONObject: itemDataDic, options: .prettyPrinted) {
            str = String(bytes: itemData, encoding: .utf8)!
        }

        //writing to file
        let fileName = "data"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("json")
        
        do {
            // Write to the file
            try str.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Oshybka 1")
        }
        
        
        
        
        //riding
        var readString = ""
        do {
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Mistake 2")
        }
        
        //to dict
        let jsonData = readString.data(using: .utf8)
        let readDictionary = try? JSONSerialization.jsonObject(with: jsonData!, options: .mutableLeaves)
        dump(readDictionary!)
        
//        //dict to array
//        var itemArray = [Item]()
//        for (key, value) in items {
//            arr.append("\(key) \(value)")
//        }
        
        
        
        
        /*
        let itemDataDic = itemDataArray.map { $0.convertToDictionary() }
        var str = String()
        if let itemData = try? JSONSerialization.data(withJSONObject: itemDataDic, options: .prettyPrinted) {
            str = String(bytes: itemData, encoding: .utf8)!
        }
        */
        
        
    }
    
    
    
    private func loadItems() {
        
        headerArray = []
        tableViewManager.removeAllSections()
        tableView.reloadData()
        
        
       
        
        sortItems()
        
        var section = TableViewSection()
        section.headerHeight = 50
        
        
        
        var previousMonth = ""
        var previousYear = ""
        
        for element in items
        {
            
            if ((element.getMonth() != previousMonth)||(element.getYear() != previousYear))
            {
                //if new section
                
                section = TableViewSection()
                section.headerHeight = 50
                section.add(item: element)
                
                headerArray.append(Item.getMonthText(date: element.ItemDate!))
                
                tableViewManager.add(section: section)
                tableView.reloadData()
                
                
                previousMonth = element.getMonth()
                previousYear = element.getYear()
                
            }
            else {
                //if existing section
                tableViewManager.remove(section: section)
                section.add(item: element)
                tableViewManager.add(section: section)
                tableView.reloadData()
                
            }
        }
    }
    
    func tableViewManager(_ manager: TableViewManager, headerViewForSection section: Int) -> UITableViewHeaderFooterView? {
        let headerView = manager.tableView.dequeueReusableHeaderFooterView(withIdentifier: "YetAnotherHeader") as! YetAnotherHeader
        headerView.nameLabel.text = headerArray[section]
        return headerView
    }
    
    func sortItems()
    {
        
        var oldItems = items
        var newItems = [Item]()
        var newestItem = oldItems[0]
        var removeIndex = 0
        var currentIndex = 0
        
        while (oldItems.count>0)
        {
            removeIndex = 0
            currentIndex = 0
            newestItem = oldItems[0]
            for element in oldItems
            {
                if (Item.isNewer(item1: element, item2: newestItem))
                {
                    newestItem = element
                    removeIndex = currentIndex
                }
                currentIndex+=1
                
            }
            
            newItems.append(newestItem)
            oldItems.remove(at: removeIndex)
        }
        
        items = newItems
        
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
        tableView.sectionHeaderHeight = 50
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 56
        
        
        //Floating Button
        let floatingButton = MDCFloatingButton()
        floatingButton.setImage(#imageLiteral(resourceName: "plus_icon_black"), for: .normal)
        floatingButton.sizeToFit()
        floatingButton.inkColor =  UIColor(red:0.11, green:0.11, blue:0.11, alpha:0.26)
        floatingButton.backgroundColor = .white
        self.view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        floatingButton.frame.origin.x = self.view.frame.width - floatingButton.frame.width - 16
        floatingButton.frame.origin.y = self.view.frame.height - floatingButton.frame.height - 16 - 49
        
        startLoadItems()
        loadItems()
        
        
    }
    
    @objc func tapped(sender: UIButton){
        print("Button was tapped!")
        showInputDialog()
    }
    
    
    
    func showInputDialog() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "New item", message: "Enter name and rating", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            let date = formatter.string(from: currentDate)
            
            //getting the input values from user
            let name = alertController.textFields?[0].text
            let rating = alertController.textFields?[1].text
            let newItem = Item()
            newItem.ItemName = name
            newItem.ItemDate = date
            newItem.ItemIcon = "movie_icon_white"
            newItem.ItemCategory = "Default"
            newItem.ItemRating = rating
            
            self.items.append(newItem)
            self.tableView.reloadData()
            self.loadItems()
            
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Rating"
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
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
    //            fatalError("something happened")
    //        }
    //        print(indexPath.section,"thiiiiSsmth ",indexPath.row)
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
