//
//  Preferences.m
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 07.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import "Preferences.h"

@interface Preferences () {
	NSUserDefaults *prefs;
}
@end


NSString * const VVVstartFromMonday		= @"stm";
NSString * const VVVmonthMode			= @"monthMode";

@implementation Preferences

+ (Preferences *) sharedPreferences
{
	static Preferences *_Preferences;
	if (_Preferences == nil) {
		_Preferences = [[Preferences alloc] init];
	}
	return _Preferences;
}

//
// Init set of data for case when actual preference file is not created yet
//
+ (void)initialize
{
	NSMutableDictionary  *defaultValues = [NSMutableDictionary dictionary];
	// set up default parameters
	[defaultValues setObject:@(YES) forKey:VVVmonthMode];
	[defaultValues setObject:@(NO) forKey:VVVstartFromMonday];


	[[NSUserDefaults standardUserDefaults] registerDefaults: defaultValues];
	
}

- (id) init
{
	if (self = [super init]) {
		prefs = [NSUserDefaults standardUserDefaults];
	}
	return self;
}


- (void) flush
{
	[[NSUserDefaults standardUserDefaults] synchronize];
}


#pragma mark -

- (BOOL) startFromMonday
{
	return [prefs boolForKey:VVVstartFromMonday];
}

- (void)setStartFromMonday:(BOOL)startFromMonday
{
	[prefs setBool:startFromMonday forKey:VVVstartFromMonday];
}

- (BOOL) monthMode
{
	return [prefs boolForKey:VVVmonthMode];
}


-(void) setMonthMode:(BOOL)monthMode
{
	[prefs setBool:monthMode forKey:VVVmonthMode];
}
@end
