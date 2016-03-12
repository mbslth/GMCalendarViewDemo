//
//  GMDayCell.h
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 08.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "GMCalendarEvent.h"


@interface GMDayCell : NSCollectionViewItem
@property (weak) IBOutlet NSTextField *textLabel;
@property (nonatomic, readwrite) GMDayCellColors cellColor;

@end
