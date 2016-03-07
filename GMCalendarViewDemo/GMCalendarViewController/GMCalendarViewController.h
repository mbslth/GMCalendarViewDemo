//
//  GMCalendarViewController.h
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 07.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GMCalendarViewController : NSViewController

/** 
	YES if seek starts from Sunday, NO, if it is started from Monday
 */
@property (nonatomic, readwrite) BOOL weekStartsFromSunday;

/**
	YES if calendar is shown in month format, NO, if in YEAR
 */
@property (nonatomic, readwrite) BOOL monthFormat;

/**
  Minimal and maximal year' numbers. Set 0 to disable limit
 */
@property (nonatomic, readwrite) NSInteger minYear;
@property (nonatomic, readwrite) NSInteger maxYear;

// currentDate - first month to display
@property (nonatomic, retain) NSDate *currentDate;

- (instancetype) initWithView:(NSView *)viewToDisplay;


/**
	Forced reloading of collection
*/
- (void) reloadData;

@end
