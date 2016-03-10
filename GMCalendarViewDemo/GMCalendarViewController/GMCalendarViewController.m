//
//  GMCalendarViewController.m
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 07.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import "GMCalendarViewController.h"
#import "GMCalendarMonthCell.h"

@interface GMCalendarViewController () <NSCollectionViewDataSource, NSCollectionViewDelegate>
{
	NSCalendar *calendar;
	NSMutableArray *dataArray;
}

@property (nonatomic, retain) NSView *parentView;
@property (weak) IBOutlet NSCollectionView *collectionView;


@end

@implementation GMCalendarViewController

NSString * const monthCellIdentifier	=	@"MonthCellIdentifier";

- (instancetype) init
{
	if (self = [super initWithNibName:[[self class] description] bundle:nil]) {
		
	}
	return self;
	
}

- (instancetype) initWithView:(NSView *)viewToDisplay
{
	if (self = [super initWithNibName:[[self class] description] bundle:nil]) {
		self.parentView = viewToDisplay;
	}
	return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	calendar = [NSCalendar currentCalendar];
	self.weekStartsFromSunday = (calendar.firstWeekday == 0);
	

	[self.collectionView registerClass:[GMCalendarMonthCell class]
				 forItemWithIdentifier:monthCellIdentifier];

//	[self.parentView addSubview:self.collectionview];
	
	
	[self prepareData];
	// set up flow layoit
	[self updateLayout];
}

- (void) viewDidAppear
{
	
}

#pragma mark - Data support

- (void) prepareData
{
	if (!dataArray) {
		dataArray = [[NSMutableArray alloc] initWithCapacity:51];
	} else {
		[dataArray removeAllObjects];
	}
	if (!self.currentDate) {
		self.currentDate = [NSDate date];
	}
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSInteger middleMonth = [calendar component:NSCalendarUnitMonth fromDate:self.currentDate];
	NSInteger middleYear = [calendar component:NSCalendarUnitYear fromDate:self.currentDate];
	
	NSInteger minimalYear = middleYear - 5;
	if (self.minYear && minimalYear < self.minYear) minimalYear = self.minYear;
	NSInteger maximalYer = middleYear + 5;
	if (self.maxYear && maximalYer > self.maxYear) maximalYer = self.maxYear;
	NSInteger currentMonthRecordIndex = -1;
	NSInteger count = 0;
	for (NSInteger y = minimalYear; y <= maximalYer; y++) {
		for (int m = 1; m <= 12; m++) {
			[dataArray addObject:@[@(m), @(y)]];
			if (m == middleYear && y == middleYear ) {
				currentMonthRecordIndex = count;
			} else {
				count++;
			}
		}
	}
	[self.collectionView reloadData];
}

#pragma mark -

- (void) setMonthFormat:(BOOL)monthFormat
{
	_monthFormat = monthFormat;
	[self updateLayout];
}

#pragma mark - Collection delegate

- (NSInteger) numberOfSectionsInCollectionView:(NSCollectionView *)collectionView
{
	if (self.monthFormat) {
		return 1;
	} else {
		// amount of years in collection
		
		return 1;		// tmp
	}
}

- (NSInteger) collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	if (self.monthFormat) {
		return dataArray.count;
	} else {
		return dataArray.count;	// tmp
	}
}
- (NSCollectionViewItem *) collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
	GMCalendarMonthCell *item = [collectionView makeItemWithIdentifier:monthCellIdentifier
															 forIndexPath:indexPath];
	// Configure the item with an image from the app's data structures
	NSArray *cItem = dataArray[indexPath.item];
	item.month = [(NSNumber *)cItem[0] integerValue];
	item.year =[(NSNumber *)cItem[1] integerValue];
	return item;
}


#pragma mark -

- (void) reloadData
{
	[self.collectionView reloadData];
}


- (void) updateLayout
{
	
	if (_monthFormat) {
	}
}

@end
