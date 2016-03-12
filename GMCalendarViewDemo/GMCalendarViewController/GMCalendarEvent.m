//
//  GMCaendarEvent.m
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 12.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import "GMCalendarEvent.h"

@interface GMCalendarEvent()
{
	NSInteger currentDay, currentMonth, currentYear;
}

@end

NSString * const GMCodingDate = @"cz.geomatix.gmcalendar.view.gmcd";
NSString * const GMCodingDesr = @"cz.geomatix.gmcalendar.view.gmde";
NSString * const GMCodingCCol = @"cz.geomatix.gmcalendar.view.gmcc";

@implementation GMCalendarEvent


- (void) setEventDate:(NSDate *)eventDate
{
	_eventDate = eventDate;
	NSCalendar *cal = [NSCalendar currentCalendar];
	currentMonth = [cal component:NSCalendarUnitMonth fromDate:self.eventDate];
	currentYear = [cal component:NSCalendarUnitYear fromDate:self.eventDate];
	currentDay = [cal component:NSCalendarUnitDay fromDate:self.eventDate];

}

- (NSInteger) day
{
	return currentDay;
}

- (NSInteger) month
{
	return currentMonth;
}

- (NSInteger) year
{
	return currentYear;
}

#pragma mark - NSCopying protocol

- (id)copyWithZone:(nullable NSZone *)zone
{
	GMCalendarEvent *newEvent = [[GMCalendarEvent alloc] init];
	newEvent.eventDate = self.eventDate;
	newEvent.cellColor = self.cellColor;
	newEvent.dayDescription = self.dayDescription;
	return newEvent;
}


#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:_dayDescription  forKey:GMCodingDesr];
	[coder encodeInteger:_cellColor forKey:GMCodingCCol];
	[coder encodeObject:_eventDate forKey:GMCodingDate];
	
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
	if (self = [super init]) {
		self.dayDescription = [aDecoder decodeObjectForKey:GMCodingDesr];
		self.cellColor = [aDecoder decodeIntegerForKey:GMCodingCCol];
		// to provide automatic calculation for convenience fields
		self.eventDate = [aDecoder decodeObjectForKey:GMCodingDate];
	}
	return self;
	
}

#pragma mark - Comparasion methods

- (BOOL) isEqual:(id)object
{
	if ([object isKindOfClass:[GMCalendarEvent class]]) {
		GMCalendarEvent *other = object;
		if (self.cellColor != other.cellColor) return NO;
		if ([self.eventDate isEqualToDate:other.eventDate] == NO) return NO;
		return ([self.dayDescription isEqualToString:other.dayDescription]);
	}
	return NO;
}

#pragma mark - Comparasion

- (NSComparisonResult) compare:(id)anotherObject
{
	GMCalendarEvent *other = anotherObject;
	return ([self.eventDate compare:other.eventDate]);
}

@end
