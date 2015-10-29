![TWCommonLib logo](TWCommonLib.png)

#TWCommonLib - why write boilerplate?

Library of iOS utilities I use in my projects. 


##TableView CoreData utilities

**TWTableViewFetchedResultsControllerBinder**

Why do we have to write NSFetchedResultsDelegate over and over again? 

Thanks to this class we don't! Just pass a tableView reference and the binder will take care of pushing all your model updates to a tableView. Oh and you'll also need to pass a block for configuring your cell on NSFetchedResultsChangeUpdate event. 

**TWCoreDataTableViewDataSource**

OK, but why do we have to implement same UITableViewDataSource methods to pass objects from NSFetchedResultsController to UITableView? 

We don't! TWCoreDataTableViewDataSource takes care of all this for you. Just tell it how to initialize an NSFetchedResultsController and it'll connect it to your tableView. That's it - you just need one method call. If you need to display more than one type of cells, you'll also have to pass a super-simple mapping block (cell NSIndexPath -> CellReuseIdentifier NSString). 

**TWArrayTableViewDataSource**

But what if I don't want to use CoreData and just need to display some content that doesn't change? 

Simple: use TWArrayTableViewDataSource instead! 

**TWSimpleTableViewDelegate**

Cool! Do you have something similar for a TableViewDelegate? 

Sure! You can setup a delegate using block syntax if you prefer that to implementing a delegate method.


##Behaviours

**TWShowOverlayWhenTableViewEmptyBehaviour**

From now on everytime you'll need to display a label or a fancy image when your tableView doesn't contain any data, you'll be able to do it in just one line of code :)


##Macros

**CallBlock**

Why do I have to check if a block is empty before calling it every single time? 

Guess what? You don't! Just invoke: CallBlock(yourBlock, /blockParameters/) and you're done! It'll do nothing if the block is not set and call it otherwise. Just what you'd expect. 

**NOT_IMPLEMENTED_YET_RETURN**

Will fall over on debug, but does nothing on release builds. 

**NOT_IMPLEMENTED_YET_RETURN_NIL**

Will fall over on debug, but does nothing on release builds. 

**UIColorMake(r,g,b)**

**defineWeakSelf()**

**NEW_AND_INIT_UNAVAILABLE**

Shorthand for annotating new and init methods as unavailable.


##Dispatch Macros

Why are all those dispatch macros so long and full of parameters that never change?

Don't ask me. Just use one of the options below: 
**DISPATCH_AFTER(NSTimeInterval when, VoidBlock)**
**DISPATCH_ASYNC(QueuePriority priority, VoidBlock)**
**DISPATCH_ASYNC_ON_MAIN_THREAD(VoidBlock)**
**DISPATCH_SYNC_ON_MAIN_THREAD(VoidBlock)**


##Delegates

**TWSimpleMapViewDelegate**

Allows you to use block syntax to manage map annotations instead of implementing delegate methods. 

**TWTextViewWithCharacterLimitDelegate**

Limits textView length.


##Other utilities

**NSObject(ObjectLifetime)**

Category that allows you to attach an object to another one just like it would be via a property (but it's using associated objects, so you can do that from a category). 

**Short names for common types of blocks (like VoidBlock, etc.)**

**Mechanism for object lazy initialization**

**TWLocationUpdatesManager**

**TWOrientationChangeDetector**

**TWOrientationChangeDetectorUsingAccelerometer**

**NSLayoutConstraint value change animations**

**UIImage manipulation methods**

**NSString trimming convinience methods**

**UIView fadeIn, fadeOut animations**

**UIView layer decorations (border, corner radius)**

**UIView easier xib loading**

**TWAlertFactory**

Easier creation of common types of alertViews.

**TWVideoThumbnailGenerator**

Creates video thumbnail using AVFoundation. 

**TWUIImagePickerExtendedEventsObserver**

Listens for UIImagePickerDidCaptureItem and UIImagePickerDidRejectItem notifications.

**and other utilities**


##License

MIT license 
