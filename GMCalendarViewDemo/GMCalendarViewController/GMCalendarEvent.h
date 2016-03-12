//
//  GMCaendarEvent.h
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 12.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef NS_ENUM(NSInteger, GMDayCellColors) {
	DayCellNormal = 0,
	DayCellWeekend,
	DayCellHoliday,
	DayCellSpecial,
};

@interface GMCalendarEvent : NSObject <NSCopying, NSCoding>

@property (nonatomic, retain) NSDate *eventDate;
@property (nonatomic, readwrite) GMDayCellColors cellColor;		// event type actually

// Just example of field, associated with day
@property (nonatomic, retain) NSString *dayDescription;

// just convenience methods to simplify processing
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger year;

@end
