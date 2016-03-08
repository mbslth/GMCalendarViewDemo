//
//  GMCalendarViewController.m
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 07.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import "GMCalendarViewController.h"

@interface GMCalendarViewController () <NSCollectionViewDataSource, NSCollectionViewDelegate>
{

}

@property (nonatomic, retain) NSView *parentView;
@property (weak) IBOutlet NSCollectionView *collectionView;


@end

@implementation GMCalendarViewController

- (instancetype) initWithView:(NSView *)viewToDisplay
{
	if (self = [super initWithNibName:[[self class] description] bundle:nil]) {
		self.parentView = viewToDisplay;
	}
	return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	// set up flow layoit
	[self updateLayout];
}

- (void) viewDidAppear
{
	
}

#pragma mark -

- (void) setMonthFormat:(BOOL)monthFormat
{
	_monthFormat = monthFormat;
	[self updateLayout];
}

#pragma mark -

- (void) reloadData
{
	[self.collectionView reloadData];
}


- (void) updateLayout
{
	
}

@end
