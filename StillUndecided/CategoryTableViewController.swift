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



class CategoryTableViewController: UIViewController,TableViewManagerDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath)
        categoryCell.backgroundColor = UIColor.white
        return categoryCell
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var wasPressed = false
    var savedBlurView: UIVisualEffectView?
    var savedAddNewButton: MDCFloatingButton?
    var savedAddNewCategoryButton: MDCFloatingButton?
    var savedFloatingButton: MDCFloatingButton?
    
    
    
    
    
    
    
    var items = [Item]()
    var itemsDouble = [[Item]]()
    
    var sectionIndexes = [Int]()
    
    var itemDataArray = [ItemData]()
    var sectionArray = [TableViewSection]()
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
    
    func writeItemsToFile() {
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
        
        //reading
        let fileName = "data"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("json")
        var readString = ""
        do {
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Mistake 2")
        }
        
        //to dict
        let jsonData = readString.data(using: .utf8)
        
        var newItems = [Item]()
        var newItem = Item()
        
        
        
        if let jsonDataArray = try? JSONSerialization.jsonObject(with: jsonData!, options: []) as? [[String: Any]] {
            for dataElement in jsonDataArray! {
                newItem = Item()
                newItem.ItemName = dataElement["ItemName"] as! String
                newItem.ItemRating = dataElement["ItemRating"] as! String
                newItem.ItemCategory = dataElement["ItemCategory"] as! String
                newItem.ItemIcon = dataElement["ItemIcon"] as! String
                newItem.ItemDate = dataElement["ItemDate"] as! String
                newItems.append(newItem)
            }
        }
        //items = newItems
        
        
        
        
        
    }
    
    
    
    private func insertItems() {
        
        sectionIndexes = []
        
        headerArray = []
        tableViewManager.removeAllSections()
        tableView.reloadData()
        
        
        
        
        sortItems()
        
        var section = TableViewSection()
        section.headerHeight = 50
        
        
        
        var previousMonth = ""
        var previousYear = ""
        
        var sectionNumber = -1
        
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
                sectionArray.append(section)
                tableView.reloadData()
                
                
                previousMonth = element.getMonth()
                previousYear = element.getYear()
                
                
                sectionNumber += 1
                sectionIndexes.append(0)
                sectionIndexes[sectionNumber] += 1
                
            }
            else {
                //if existing section
                tableViewManager.remove(section: section)
                section.add(item: element)
                tableViewManager.add(section: section)
                sectionArray.append(section)
                tableView.reloadData()
                sectionIndexes[sectionNumber] += 1
                
            }
        }
        writeItemsToFile()
        tableView.reloadData()
        
    }
    
    func tableViewManager(_ manager: TableViewManager, headerViewForSection section: Int) -> UITableViewHeaderFooterView? {
        let headerView = manager.tableView.dequeueReusableHeaderFooterView(withIdentifier: "YetAnotherHeader") as! YetAnotherHeader
        headerView.nameLabel.text = headerArray[section]
        return headerView
    }
    
    func sortItems()
    {
        if !(items.isEmpty) {
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
        
        
    }
    
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return 0
    //    }
    
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
    
    //    func tableViewManager(_ manager: TableViewManager, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //
    //
    //            sectionArray[indexPath.section].remove(item: items[indexPath.row])
    //            print(indexPath.row)
    //            var removeIndex = 0
    //
    //                if (indexPath.section != 0)
    //                {
    //                    for i in 0...indexPath.section-1 {
    //                        removeIndex+=self.sectionIndexes[i]
    //                    }
    //                }
    //                    removeIndex+=indexPath.row
    //
    //                    items.remove(at: removeIndex)
    //
    //                    insertItems()
    //                    writeItemsToFile()
    //
    //                    } else if editingStyle == .insert {
    //
    //        }
    //    }
    
    func tableViewManager(_ manager: TableViewManager, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, view, handler) in
            
            self.sectionArray[indexPath.section].remove(item: self.items[indexPath.row])
            print(indexPath.row)
            
            var shareIndex = 0
            var title = String()
            var rating = String()
            
            if (indexPath.section != 0){
                
                for i in 0...indexPath.section-1 {
                    shareIndex+=self.sectionIndexes[i]
                }
            }
            shareIndex+=indexPath.row
            
            title = self.items[shareIndex].ItemName!
            rating = self.items[shareIndex].ItemRating!
            
            UIGraphicsBeginImageContext(view.frame.size)
            view.layer.render(in: UIGraphicsGetCurrentContext()!)
            UIGraphicsEndImageContext()
            
            let textToShare = "I rated «" + title + "» at " + rating + " out of 10"
            
            let objectsToShare = [textToShare] as [Any]
            let shareWindow = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //Excluded Activities
            shareWindow.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
            //
            
            self.present(shareWindow, animated: true, completion: nil)
        }
        
        
        
        
        
        var shareImage = UIImage(named: "share_icon_black")?.withRenderingMode(.alwaysOriginal)
        shareAction.backgroundColor = UIColor(red:0.11, green:0.11, blue:0.11, alpha:0.0)
        shareAction.image = shareImage
        
        
        
        
        let configuration = UISwipeActionsConfiguration(actions: [shareAction])
        return configuration
    }
    
    
    func tableViewManager(_ manager: TableViewManager, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            
            self.sectionArray[indexPath.section].remove(item: self.items[indexPath.row])
            print(indexPath.row)
            var removeIndex = 0
            
            if (indexPath.section != 0){
                
                for i in 0...indexPath.section-1 {
                    removeIndex+=self.sectionIndexes[i]
                }
            }
            removeIndex+=indexPath.row
            
            self.items.remove(at: removeIndex)
            
            self.insertItems()
        }
        deleteAction.backgroundColor = UIColor(red:0.11, green:0.11, blue:0.11, alpha:0.0)
        deleteAction.image = UIImage(named: "delete_icon_black")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
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
        floatingButton.addTarget(self, action: #selector(callFABMenu), for: .touchUpInside)
        
        floatingButton.frame.origin.x = self.view.frame.width - floatingButton.frame.width - 16
        floatingButton.frame.origin.y = self.view.frame.height - floatingButton.frame.height - 16 - 49
        
        startLoadItems()
        insertItems()
        
        
        
        
    }
    
    @objc func callFABMenu(sender: MDCFloatingButton){
        savedFloatingButton = sender
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //always fill the view
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let addNewButton = MDCFloatingButton()
        let addNewCategoryButton = MDCFloatingButton()
        
        
        if wasPressed==false {
            
            wasPressed = true
            
            UIApplication.shared.statusBarView?.backgroundColor = UIColor(red:0.11, green:0.11, blue:0.11, alpha:0)
            
            view.insertSubview(blurEffectView, belowSubview: sender)
            savedBlurView = blurEffectView
            blurEffectView.alpha = 0
            
            UIView.animate(withDuration: 0.3) {
                UIApplication.shared.statusBarView?.backgroundColor = UIColor(red:0.11, green:0.11, blue:0.11, alpha:0.1)
                blurEffectView.alpha = 1.0
            }
            
            UIView.animate(withDuration: 0.15, animations: {
                sender.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
            })
            
            
            
            
            addNewCategoryButton.setImage(#imageLiteral(resourceName: "category_icon_black"), for: .normal)
            addNewCategoryButton.frame.size = CGSize(width: 40, height: 40)
            addNewCategoryButton.inkColor =  UIColor(red:0.11, green:0.11, blue:0.11, alpha:0.26)
            addNewCategoryButton.backgroundColor = .white
            self.view.insertSubview(addNewCategoryButton, belowSubview: addNewButton)
            addNewCategoryButton.frame.origin.x = self.view.frame.width - addNewCategoryButton.frame.width - 24
            addNewCategoryButton.frame.origin.y = self.view.frame.height - addNewCategoryButton.frame.height - sender.frame.height - 8 - 49
            savedAddNewCategoryButton = addNewCategoryButton;
            
            addNewCategoryButton.alpha = 0
            UIView.animate(withDuration: 0.2) {
                addNewCategoryButton.alpha = 1.0
            }
            
            
            addNewButton.setImage(#imageLiteral(resourceName: "star_icon_black"), for: .normal)
            addNewButton.frame.size = CGSize(width: 40, height: 40)
            addNewButton.inkColor =  UIColor(red:0.11, green:0.11, blue:0.11, alpha:0.26)
            addNewButton.backgroundColor = .white
            self.view.insertSubview(addNewButton, belowSubview: sender)
            addNewButton.frame.origin.x = self.view.frame.width - addNewButton.frame.width - 24
            addNewButton.frame.origin.y = self.view.frame.height - addNewButton.frame.height - addNewButton.frame.height - sender.frame.height - 24 - 49
            addNewButton.addTarget(self, action: #selector(addNew), for: .touchUpInside)
            savedAddNewButton = addNewButton;
            
            addNewButton.alpha = 0
            UIView.animate(withDuration: 0.2, delay: 0.035, options: [], animations: {
                addNewButton.alpha = 1.0
                
                
                
            })
            
            
            
            
            
        } else {
            
            wasPressed = false
            
            
            
            UIView.animate(withDuration: 0.3) {
                UIApplication.shared.statusBarView?.backgroundColor = UIColor(red:0.11, green:0.11, blue:0.11, alpha:1.0)
                self.savedBlurView?.alpha = 0
            }
            
            
            
            UIView.animate(withDuration: 0.2) {
                self.savedAddNewButton?.alpha = 0
            }
            
            UIView.animate(withDuration: 0.2, delay: 0.035, options: [], animations: {
                self.savedAddNewCategoryButton?.alpha = 0
            })
            
            UIView.animate(withDuration: 0.15, animations: {
                sender.transform = CGAffineTransform(rotationAngle: 0)
            })
            
            
        }
        
        
        
    }
    
    @objc func addNew(sender: UIButton){
        UIView.animate(withDuration: 0.2) {
            self.savedAddNewButton?.alpha = 0
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.035, options: [], animations: {
            self.savedAddNewCategoryButton?.alpha = 0
        })
        UIView.animate(withDuration: 0.2, delay: 0.050, options: [], animations: {
            self.savedFloatingButton?.alpha = 0
        })
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: view.frame.size.width/3 - 20, height: view.frame.size.height/6)
        
        let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "categoryCell")
        myCollectionView.backgroundColor = UIColor(red:0.11, green:0.11, blue:0.11, alpha:0.0)
        myCollectionView.alpha = 0
        view.insertSubview(myCollectionView, belowSubview: sender)
        UIView.animate(withDuration: 0.4, delay: 0, options: [], animations: {
            myCollectionView.alpha = 1.0
        })
        
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
            self.insertItems()
            self.writeItemsToFile()
            
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

