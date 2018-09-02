import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var itemNameField: NSTextField!
    @IBOutlet weak var itemQuantityField: NSTextField!
    @IBOutlet weak var itemDescriptionField: NSTextField!
    @IBOutlet weak var storageLocationField: NSTextField!
    @IBOutlet weak var individualUsingItemField: NSTextField!
    
    @IBOutlet weak var dateReceivedPicker: NSDatePicker!
    
    @IBOutlet weak var isItemInUseDropdown: NSPopUpButton!
    
    @IBOutlet weak var inventoryTable: NSTableView!
    
    let currentDate:NSDate = NSDate();
    
    var items:[InventoryItem]? = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inventoryTable.delegate = self;
        inventoryTable.dataSource = self;
        
        itemNameField.resignFirstResponder();
        itemQuantityField.resignFirstResponder();
        itemDescriptionField.resignFirstResponder();
        dateReceivedPicker.resignFirstResponder();
        storageLocationField.resignFirstResponder();
        isItemInUseDropdown.resignFirstResponder();
        individualUsingItemField.resignFirstResponder();
    }

    override var representedObject: Any? {
        didSet {}
    }

    @IBAction func addItemToInventory(_ sender: Any) {
        let item:InventoryItem = InventoryItem(itemName: itemNameField.stringValue, quantity: Int(itemQuantityField.stringValue)!,
            itemDescription: itemDescriptionField.stringValue, dateReceived: dateReceivedPicker.dateValue,
            itemStorageLocation: storageLocationField.stringValue, dateEntered: currentDate,
             isCurrentlyInUse: isItemInUseDropdown.titleOfSelectedItem!, individualUsingItem: individualUsingItemField.stringValue);
        items?.append(item);
        inventoryTable.reloadData();
        
    }
    
    @IBAction func removeItemFromInventory(_ sender: Any) {
        inventoryTable.removeRows(at: inventoryTable.selectedRowIndexes, withAnimation: NSTableView.AnimationOptions.effectFade);
    }
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return items?.count ?? 0;
    }
}

extension ViewController: NSTableViewDelegate {
    fileprivate enum CellIdentifiers {
        static let itemNameCell = "itemNameID";
        static let quantityCell = "quantityID";
        static let descriptionCell = "descriptionID";
        static let dateReceivedCell = "dateReceivedID";
        static let dateEnteredCell = "dateEnteredID";
        static let storageLocationCell = "storageLocationID";
        static let beingUsedCell = "beingUsedID";
        static let personUsingItemCell = "personUsingItemID";
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var text:String = "";
        var cellIdentifier:String = "";
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateStyle = .short;
        
        guard let item = items?[row] else {
            return nil;
        }
        
        switch (tableColumn) {
            case tableView.tableColumns[0]:
                text = item.getItemName();
                cellIdentifier = CellIdentifiers.itemNameCell;
                break;
            case tableView.tableColumns[1]:
                text = String(item.getQuantity());
                cellIdentifier = CellIdentifiers.quantityCell;
                break;
            case tableView.tableColumns[2]:
                text = item.getItemDescription();
                cellIdentifier = CellIdentifiers.descriptionCell;
                break;
            case tableView.tableColumns[3]:
                text = dateFormatter.string(from: item.getDateReceived());
                cellIdentifier = CellIdentifiers.dateReceivedCell;
                break;
            case tableView.tableColumns[4]:
                text = dateFormatter.string(for: item.getDateEntered())!;
                cellIdentifier = CellIdentifiers.dateEnteredCell;
                break;
            case tableView.tableColumns[5]:
                text = item.getItemStorageLocation();
                cellIdentifier = CellIdentifiers.storageLocationCell;
                break;
            case tableView.tableColumns[6]:
                text = item.getIsCurrentlyInUse();
                cellIdentifier = CellIdentifiers.beingUsedCell;
                break;
            case tableView.tableColumns[7]:
                text = item.getIndividualUsingItem();
                cellIdentifier = CellIdentifiers.personUsingItemCell;
                break;
            default:
                break;
        }
        
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text;
            return cell;
        }
        return nil;
    }
}


















