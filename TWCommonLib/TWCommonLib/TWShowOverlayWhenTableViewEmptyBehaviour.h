//
//  CommonLib
//

#import "TWCommonMacros.h"
#import "TWObjectCountProtocol.h"


/**
 * Behaviour for making overlay view visible when table view has no cells (and optionally blocking tableView scrolling).
 */
@interface TWShowOverlayWhenTableViewEmptyBehaviour : NSObject

NEW_AND_INIT_UNAVAILABLE

/**
 * @param overlayView   Doesn't have to be subview of tableView (ideally it shouldn't be). But it has to already be in the view hierarchy - if it's not, it won't be added! 
 */
- (instancetype)initWithTableView:(UITableView *)tableView dataSource:(id<TWObjectCountProtocol>)dataSource overlayView:(UIView *)alternativeView allowScrollingWhenNoCells:(BOOL)allowScrollingWhenNoCells;

/**
 * Should be called from viewWillAppear (for tableView) and should be triggered from any core data updates on tableView data
 */
- (void)updateTableViewScrollingAndOverlayViewVisibility;

@end
