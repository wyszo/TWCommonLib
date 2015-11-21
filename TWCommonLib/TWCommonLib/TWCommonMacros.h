//
//  TWCommonLib
//

#ifndef TWCommonLib_TWCommonMacros_h
#define TWCommonLib_TWCommonMacros_h


#pragma mark -  Inside methods: Blocks

#define CallBlock(block, ...) (block ? block(__VA_ARGS__) : nil);


#pragma mark -  Inside methods: Weak/Strong self

#define defineWeakSelf() __weak typeof(self) weakSelf = self
// this macro makes sense only at the beginning of the block (before which weakSelf has been defined)
#define defineStrongSelf() typeof(self) strongSelf = weakSelf


#pragma mark -  Inside methods: Color Utilities

// TODO: change ColorMake macros into C functions to get type checking
#define UIColorMake(r,g,b) [UIColor colorWithRed:((CGFloat)r)/255.0 green:((CGFloat)g)/255.0 blue:((CGFloat)b)/255 alpha:1.0]
#define UIColorWithAlphaMake(r,g,b,a) [UIColor colorWithRed:((CGFloat)r)/255.0 green:((CGFloat)g)/255.0 blue:((CGFloat)b)/255 alpha:a]
#define UIFontMake(fontName,fontSize) [UIFont fontWithName:fontName size:fontSize]


#pragma mark -  Inside methods: Safe values

// Macros helping avoid ternary operator abuse (value ?: alternativeValue)
#define ValueIfExistsOr(value, alternativeValue) (value ? value : alternativeValue)
#define ValueOr(value, alternativeValue) (value ? value : alternativeValue)
#define ValueOrEmptyString(value) (value ? value : @"")


#pragma mark -  Inside methods: Nulls

#define NOOP ; // No operation

#define ObjectOrNull(object) ((object != nil) ? (id)(object) : (id)([NSNull null]))


#pragma mark - Assertions inside methods

#define NOT_IMPLEMENTED_YET_RETURN AssertTrueOrReturn(NO && @"Not implemented yet");
#define NOT_IMPLEMENTED_YET_RETURN_NIL AssertTrueOrReturnNil(NO && @"Not implemented yet");


#pragma mark - Boxing Values

#define BoxObject(object) [NSValue valueWithNonretainedObject:object]
#define UnboxObject(boxedObject) [boxedObject nonretainedObjectValue]

#define BoxPointer(pointer) [NSValue valueWithPointer:pointer]
#define UnboxPointer(boxedPointer) [boxedPointer pointerValue]

#define STRINGIFY(string) #string

/**
 Useful when we want to have selector as NSString but we still want to get an error if a selector is not implemented
 */
#define SelectorString(methodName) NSStringFromSelector(@selector(methodName))


#pragma mark - Suppressing diagnostic warnings

#define CLANG_DIAGNOSTIC_PUSH _Pragma("clang diagnostic push")
#define CLANG_DIAGNOSTIC_POP _Pragma("clang diagnostic pop")

#define PRAGMA_DIAGNOSTIC_IGNORED(param) _Pragma(STRINGIFY(clang diagnostic ignored param))

// Suppresing perform selector leaking

#define SuppressPerformSelectorLeakWarning(Code) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Code; \
_Pragma("clang diagnostic pop") \
} while (0)

// Suppresing Nullability warnings

#define SUPPRESS_NULLABILITY_COMPLETENESS_BEGIN \
CLANG_DIAGNOSTIC_PUSH \
PRAGMA_DIAGNOSTIC_IGNORED("-Wnullability-completeness")

#define SUPPRESS_NULLABILITY_COMPLETENESS_END \
CLANG_DIAGNOSTIC_POP

// Suppresing Deprecation warnings

#define SUPPRESS_DEPRECATION_WARNINGS_BEGIN \
CLANG_DIAGNOSTIC_PUSH \
PRAGMA_DIAGNOSTIC_IGNORED("-Wdeprecated-declarations")

#define SUPPRESS_DEPRECATION_WARNINGS_END \
CLANG_DIAGNOSTIC_POP


#pragma mark - Inside class interface definition

// New, Init unavailable

#define NEW_AND_INIT_UNAVAILABLE \
SUPPRESS_NULLABILITY_COMPLETENESS_BEGIN \
+ (instancetype)new __unavailable; \
- (instancetype)init __unavailable; \
SUPPRESS_NULLABILITY_COMPLETENESS_END

// Disclaimer: using singletons is generally discouraged, try to use dependency injection framework (such as Objection or Typhoon) instead!
#define SHARED_INSTANCE_GENERATE_INTERFACE \
SUPPRESS_NULLABILITY_COMPLETENESS_BEGIN \
+ (instancetype)sharedInstance; \
SUPPRESS_NULLABILITY_COMPLETENESS_END


#pragma mark - Inside class implementation

// Disclaimer: using singletons is generally discouraged, try to use dependency injection framework (such as Objection or Typhoon) instead!
#define SHARED_INSTANCE_GENERATE_IMPLEMENTATION \
+ (instancetype)sharedInstance \
{ \
  static id sharedInstance = nil; \
  static dispatch_once_t onceToken; \
  dispatch_once(&onceToken, ^{ \
    sharedInstance = [[self alloc] init]; \
  }); \
  return sharedInstance; \
}


#endif
