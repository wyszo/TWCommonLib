//
//  PlayerAid
//

#import "TWCommonMacros.h"

/**
 Allows to easily chain textfiels so that when one returns, next one becomes active. textFieldShouldReturn: needs to be called manually, helper doesn't set itself as textfield delegate.
 */
@interface TWTextFieldsFormHelper : NSObject

NEW_AND_INIT_UNAVAILABLE

- (nullable instancetype)initWithTextFieldsToChain:(nonnull NSArray *)textfields;

- (void)textFieldShouldReturn:(nonnull UITextField *)textField;

@end
