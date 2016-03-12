//
//  GMDayCell.m
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 08.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import "GMDayCell.h"

@interface GMDayCell () {
	GMDayCellColors color;
}

@end

@implementation GMDayCell

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
	self.cellColor = DayCellNormal;
}

// Returns pair of colors - foreground and background for each type of
// day listed in DayCellColor

- (NSArray *) colorsForCurrentDay
{
	switch (self.cellColor) {
		case DayCellNormal:
			return @[ [NSColor blackColor], [NSColor clearColor]];
		case DayCellHoliday:
			return @[ [NSColor blueColor], [NSColor yellowColor]];
		case DayCellSpecial:
			return @[ [NSColor whiteColor], [NSColor blueColor]];
		case DayCellWeekend:
			return @[ [NSColor redColor], [NSColor clearColor]];
		default:
			return nil;
	}
}

#pragma mark -

- (GMDayCellColors) cellColor
{
	return color;
}

- (void) setCellColor:(GMDayCellColors)cellColor
{
	color = cellColor;
	NSArray *cColorSet = [self colorsForCurrentDay];
	self.textLabel.textColor = cColorSet[0];
	
	self.view.wantsLayer = YES;
	self.view.layer.backgroundColor = [(NSColor *)cColorSet[1] CGColor];
	if (cellColor == DayCellSpecial || cellColor == DayCellSpecial) {
		self.view.layer.cornerRadius = self.view.frame.size.height / 7.0;
	} else {
		self.view.layer.cornerRadius = 0.0;
	}
}

@end
