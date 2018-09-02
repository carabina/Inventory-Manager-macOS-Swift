import Foundation;

class InventoryItem {
    private var itemName:String;
    private var quantity:Int;
    private var itemDescription:String;
    private var dateReceived:Date;
    private var itemStorageLocation:String;
    private var dateEntered:NSDate;
    private var isCurrentlyInUse:String;
    private var individualUsingItem:String;
    
    init() {
        self.itemName = "";
        self.quantity = 0;
        self.itemDescription = "";
        self.dateReceived = Date();
        self.itemStorageLocation = "";
        self.dateEntered = NSDate();
        self.isCurrentlyInUse = "";
        self.individualUsingItem = "";
    }
    
    init(itemName:String, quantity:Int, itemDescription:String, dateReceived:Date, itemStorageLocation:String, dateEntered:NSDate, isCurrentlyInUse:String, individualUsingItem:String) {
        self.itemName = itemName;
        self.quantity = quantity;
        self.itemDescription = itemDescription;
        self.dateReceived = dateReceived;
        self.itemStorageLocation = itemStorageLocation;
        self.dateEntered = dateEntered;
        self.isCurrentlyInUse = isCurrentlyInUse;
        self.individualUsingItem = individualUsingItem;
    }
    
    public func setItemName(itemName:String) {
        self.itemName = itemName;
    }
    
    public func getItemName() -> String {
        return itemName;
    }
    
    public func setQuantity(quantity:Int) {
        self.quantity = quantity;
    }
    
    public func getQuantity() -> Int {
        return quantity;
    }
    
    public func setItemDescription(itemDescription:String) {
        self.itemDescription = itemDescription;
    }
    
    public func getItemDescription() -> String {
        return itemDescription;
    }
    
    public func setDateReceived(dateReceived:Date) {
        self.dateReceived = dateReceived;
    }
    
    public func getDateReceived() -> Date {
        return dateReceived;
    }
    
    public func setItemStorageLocation(itemStorageLocation:String) {
        self.itemStorageLocation = itemStorageLocation;
    }
    
    public func getItemStorageLocation() -> String {
        return itemStorageLocation;
    }
    
    public func setDateEntered(dateEntered:NSDate) {
        self.dateEntered = dateEntered;
    }
    
    public func getDateEntered() -> NSDate {
        return dateEntered;
    }
    
    public func setIsCurrentlyInUse(isCurrentlyInUse:String) {
        self.isCurrentlyInUse = isCurrentlyInUse;
    }
    
    public func getIsCurrentlyInUse() -> String {
        return isCurrentlyInUse;
    }
    
    public func setIndividualUsingItem(individualUsingItem:String) {
        self.individualUsingItem = individualUsingItem;
    }
    
    public func getIndividualUsingItem() -> String {
        return individualUsingItem;
    }
}
