import Foundation

public extension String {
    /**
     Replaces multiple whitespaces in string with just one
     */
    var condensedWhitespace: String {
        let components = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        return components.filter { !$0.isEmpty }.joinWithSeparator(" ")
    }
    
    var stringByRemovingHtmlTags: String {
        return self.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil);
    }
}
