import Foundation

enum JSONError: String, Error {
    case NoData = "Error: no data"
    case ConversionFailed = "Error: Conversion from JSON failed"
}

extension Data {
    public func jsonDictionary() throws -> [AnyHashable: Any] {
        guard let jsonResponse = try JSONSerialization.jsonObject(with: self, options: []) as? [AnyHashable: Any] else {
            throw JSONError.ConversionFailed
        }
        return jsonResponse
    }

    public func jsonArray() throws -> [AnyObject] {
        guard let jsonResponse = try JSONSerialization.jsonObject(with: self, options: []) as? [AnyObject] else {
            throw JSONError.ConversionFailed
        }
        return jsonResponse
    }
}
