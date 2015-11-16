//
//  TWCommonLib
//

@import KZAsserts;
#import "NSFetchedResultsController+TWFetch.h"

@implementation NSFetchedResultsController (TWFetch)

- (void)tw_performFetchAssertResults
{
  NSError *error;
  [self performFetch:&error];
  AssertTrueOrReturn(!error);
}

@end
