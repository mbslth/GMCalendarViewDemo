//
//  GMDayCell.h
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 08.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSInteger, GMDayCellColors) {
	DayCellNormal = 0,
	DayCellWeekend,
	DayCellHoliday,
	DayCellSpecial,
};


@interface GMDayCell : NSCollectionViewItem
@property (weak) IBOutlet NSTextField *textLabel;
@property (nonatomic, readwrite) GMDayCellColors cellColor;

@end
