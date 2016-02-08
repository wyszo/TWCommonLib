import Foundation

extension Dictionary where Key: StringLiteralConvertible, Value: AnyObject {
    public func jsonEncodedData() throws -> NSData? {
        if NSJSONSerialization.isValidJSONObject(self as! AnyObject) {
            return try? NSJSONSerialization.dataWithJSONObject(self as! AnyObject, options: [])
        }
        return nil
    }
}
