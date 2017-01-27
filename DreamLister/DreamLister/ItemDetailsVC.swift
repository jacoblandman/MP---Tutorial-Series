//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Krutarth Trivedi on 1/23/17.
//  Copyright © 2017 Krutarth Trivedi. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    @IBOutlet weak var thumbImg: UIImageView!
    
    var stores = [Store]()
    var itemTypes = [ItemType]()
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        //Initially generate pre-defined item types and stores for the pickers.
//        generateTestOtherData()
        
        getStores()
        getItemTypes()
        
        if itemToEdit != nil {
            
            loadItemData()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0  {
            let itmType  = itemTypes[row]
//            print ("Title for row \(row) in itemTypePicker is \(itmType.type)")
            return itmType.type
            
        } else {
            let store = stores[row]
            return store.name
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            print ("# of rows loaded in itemTypePicker is \(itemTypes.count)")
            return itemTypes.count
        } else {
            print ("# of rows loaded in storePicker is \(stores.count)")
            return stores.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // update when selected
    }
    
    func getStores() {
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            
            // handle the error
        }
    }
    
    // Get ItemTypes
    func getItemTypes() {
        
        let fetchRequest: NSFetchRequest<ItemType> = ItemType.fetchRequest()
        
        do {
            
            self.itemTypes = try context.fetch(fetchRequest)
        } catch {
            
            // handle the error
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        var item: Item!
        let picture = Image(context: context)
        picture.image = thumbImg.image
        
        if itemToEdit == nil {
            
            item = Item(context: context)
        } else {
            
            item = itemToEdit
        }
        
        item.toImage = picture
        
        if let title = titleField.text {
            item.title = title
        }
        
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
        }
        
        if let details = detailsField.text {
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func loadItemData() {
        
        print ("in the loadItemData() function now")
        
        if let item = itemToEdit {
            
            print ("starting to load pulled item into current item")
            print ("toItemType.type: \(item.toItemType?.type)")
            
            titleField.text = item.title
            priceField.text = String(item.price)
            detailsField.text = item.details
            
            thumbImg.image = item.toImage?.image as? UIImage
            
            print ("finished loading pulled item details into current item")
            
            if let typeOfItem = item.toItemType {
                
                print ("Starting to load itemType data into itemtype picker")
                
                var index2 = 0
                repeat {
                    
                    let i = itemTypes[index2]
                    if i.type == typeOfItem.type {
                        print ("i.type or itemTypes[index].type: \(i.type)")
                        print ("typeOfItem.type or itemToEdit.toItemType.type: \(typeOfItem.type)")
                        break
                    }
                    index2 += 1
                    print ("Finished loading itemType data into itemtype picker")
                } while (index2 < itemTypes.count)
            }
            
            if let store = item.toStore {
                
                print ("Starting to load store data into store picker")
                var index = 0
                repeat {
                    
                    let s = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        print ("s.name or stores[index].name: \(s.name)")
                        print ("store.name or itemToEdit.toStore.name: \(store.name)")
                        break
                    }
                    index += 1
                print ("FInished loading store data into store picker")
                } while (index < stores.count)
                
            }
        }
    }
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            thumbImg.image = img
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func generateTestOtherData() {
        
                let store = Store(context: context)
                store.name = "Best Buy"
                let store2 = Store(context: context)
                store2.name = "Tesla Dealership"
                let store3 = Store(context: context)
                store3.name = "Frys Electronics"
                let store4 = Store(context: context)
                store4.name = "Target"
                let store5 = Store(context: context)
                store5.name = "Amazon"
                let store6 = Store(context: context)
                store6.name = "K Mart"
                let store7 = Store(context: context)
                store7.name = "Nebraska Furniture Mart"
                let store8 = Store(context: context)
                store8.name = "Other"
        
                let itemType = ItemType(context: context)
                itemType.type = "Electronics"
                let itemType2 = ItemType(context: context)
                itemType2.type = "Cars"
                let itemType3 = ItemType(context: context)
                itemType3.type = "Games"
                let itemType4 = ItemType(context: context)
                itemType4.type = "Gadgets"
                let itemType5 = ItemType(context: context)
                itemType5.type = "Foods"
                let itemType6 = ItemType(context: context)
                itemType6.type = "Furniture"
                let itemType7 = ItemType(context: context)
                itemType7.type = "Other"
        
                ad.saveContext()
        
    }

    
}
