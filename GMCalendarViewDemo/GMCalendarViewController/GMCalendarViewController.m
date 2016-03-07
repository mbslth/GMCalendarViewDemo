//
//  GMCalendarViewController.m
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 07.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import "GMCalendarViewController.h"

@interface GMCalendarViewController () {

}

@property (nonatomic, retain) NSView *parentView;

@property (nonatomic, retain) IBOutlet NSCollectionView *streamCollectionView;

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
    // Do view setup here.
}


- (void) reloadData
{
	[self.streamCollectionView reloadData];
}

@end
