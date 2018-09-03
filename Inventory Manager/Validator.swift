public class Validator {
    public static func isValid(validationCondition:Bool) -> Bool {
        if(validationCondition) {
            return true;
        } else {
            return false;
        }
    }
    
    public static func isValidNumber(fieldContent:String) -> Bool {
        if let convertedNumber = Int(fieldContent) {
            return true;
        } else {
            return false;
        }
    }
    
    public static func isValidSelection(popupButtonSelection:String) -> Bool {
        if(popupButtonSelection != "") {
            return true;
        } else {
            return false;
        }
    }
}
