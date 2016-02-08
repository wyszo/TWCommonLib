import Foundation

enum JSONError: String, ErrorType {
    case NoData = "Error: no data"
    case ConversionFailed = "Error: Conversion from JSON failed"
}

extension NSData {
    func jsonDictionary() throws -> [NSObject: AnyObject] {
        guard let jsonResponse = try NSJSONSerialization.JSONObjectWithData(self, options: []) as? [NSObject : AnyObject] else {
            throw JSONError.ConversionFailed
        }
        return jsonResponse
    }

    func jsonArray() throws -> [AnyObject] {
        guard let jsonResponse = try NSJSONSerialization.JSONObjectWithData(self, options: []) as? [AnyObject] else {
            throw JSONError.ConversionFailed
        }
        return jsonResponse
    }
}