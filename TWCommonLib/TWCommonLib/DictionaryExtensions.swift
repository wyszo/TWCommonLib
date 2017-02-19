import Foundation

extension Dictionary where Key: ExpressibleByStringLiteral, Value: AnyObject {
    public func jsonEncodedData() throws -> Data? {
        if JSONSerialization.isValidJSONObject(self as AnyObject) {
            return try? JSONSerialization.data(withJSONObject: self as AnyObject, options: [])
        }
        return nil
    }
}
