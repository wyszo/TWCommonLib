import Foundation

public extension String {
    /**
     Replaces multiple whitespaces in string with just one
     */
    var condensedWhitespace: String {
        let components = self.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    var stringByRemovingHtmlTags: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil);
    }
}
