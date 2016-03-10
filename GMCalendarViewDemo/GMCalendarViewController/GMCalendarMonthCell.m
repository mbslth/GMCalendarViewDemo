//
//  GMCalendarMonthCell.m
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 08.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import "GMCalendarMonthCell.h"
#import "GMDayCell.h"

NSString * const VVVCalendarViewStartWeekDayChanged	=	@"VVVCalendarViewStartWeekDayChanged";


NSString * const DAY_CELL_ID		=	@"GMDayCell";


@interface GMCalendarMonthCell()
{
	NSInteger	amountOfDays;
	NSInteger	amountOfWeeks;
	
	NSCalendar *calendar;
}

@property (nonatomic, retain) NSDate *startDate;

@end

@implementation GMCalendarMonthCell

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

		calendar = [NSCalendar currentCalendar];
		
		NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
		[nc addObserver:self selector:@selector(updateWeekStart:) name:VVVCalendarViewStartWeekDayChanged object:nil];
		
	}
	return self;
}


- (void) viewDidLoad
{
	amountOfDays = [self daysInMonth];
	amountOfWeeks = [self numberOfWeeks];
	
	self.monthLabel.stringValue = [self monthName];
	
	[self.collectionView registerClass:[GMDayCell class] forItemWithIdentifier:DAY_CELL_ID];
	
	
	
}

- (void) updateWeekStart:(NSNotification *) note
{
	BOOL mondayStart = [[note object] boolValue];
	self.weekStartOnMonday = mondayStart;
	
	amountOfDays = [self daysInMonth];
	amountOfWeeks = [self numberOfWeeks];
	[self.collectionView reloadData];
}

//
// If this cell is selected we will show lightgey border
//
- (void) setSelected:(BOOL)selected
{
	self.view.wantsLayer = YES;
	CALayer *layer = self.view.layer;
	layer.cornerRadius = 4;
	if (selected) {
		layer.borderColor = [NSColor lightGrayColor].CGColor;
		layer.borderWidth = 1.0;
	} else {
		layer.borderColor = [NSColor clearColor].CGColor;
		layer.borderWidth = 0.0;
	}
}

#pragma mark - 

//
// Our month collection has two sections - with names of days and day numbers
// Both types of cells have the same prototype cell with one text label inside
//
- (NSInteger) numberOfSectionsInCollectionView:(NSCollectionView *)collectionView
{
	return 2;
}

- (NSInteger) collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	if (section == 0) {
		return 7;
	} else {
		return amountOfWeeks * 7;	// fill with spaces
	}
}

- (NSCollectionViewItem *) collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
	

	GMDayCell *item = [collectionView makeItemWithIdentifier:DAY_CELL_ID
															 forIndexPath:indexPath];
	// Configure the item with an image from the app's data structures
	if (indexPath.section == 0) {
		item.textLabel.stringValue = [self dayName:indexPath.item];
	} else {
		item.textLabel.stringValue = [self dateName:indexPath.item];
	}
	return item;
}


#pragma mark - Utility functions

- (NSInteger) daysInMonth
{
	NSInteger days[12] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	if ((self.month == 2) && ((self.year % 4) == 0)) {
		return 29;
	}
	return days[self.month];
}

// text content for the section with days of week names
- (NSString *) dayName:(NSInteger) pos
{
	NSArray *dayNames = @[@"SUN", @"MON", @"TUE", @"WED", @"THU", @"FRI", @"SAT"];
	if (self.weekStartOnMonday) {
		pos++;
		if (pos >= 7) pos = 0;
	}
	return dayNames[pos];
}

// text content for the second - main section
- (NSString *)dateName:(NSInteger) pos
{
	NSString *value = @"";
	NSInteger offset = [self numberOfDaysInFirstWeek];
	if (pos >= offset) {
		pos -= offset;
		if (pos < [self daysInMonth]) {
			value = [NSString stringWithFormat:@"%ld",pos+1];
		}
	}
	return value;
}

- (NSDate *)firstDay
{
	NSDateComponents *components = [[NSDateComponents alloc] init];
	components.day = 1;
	components.month = self.month;
	components.year = self.year;
	return [calendar dateFromComponents:components];
}

- (NSInteger)numberOfWeeks {
	return [calendar rangeOfUnit:NSCalendarUnitDay
								 inUnit:NSCalendarUnitWeekOfMonth
								forDate:[self firstDay]].length;
}


- (NSInteger)numberOfDaysInFirstWeek {
	return [calendar rangeOfUnit:NSCalendarUnitDay
								 inUnit:NSCalendarUnitWeekOfMonth
								forDate:[self firstDay]].length;
}


- (NSString *) monthName
{
	NSArray *month = @[ @"January", @"February", @"March", @"April", @"May", @"June",
					   @"July", @"August", @"September", @"October", @"November", @"December"];
	return month[self.month];
}

@end
