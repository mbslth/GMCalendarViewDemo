//
//  AppDelegate.m
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 07.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import "AppDelegate.h"
#import "Preferences.h"

@interface AppDelegate () {
	Preferences *prefs;
}

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	prefs = [Preferences sharedPreferences];

	self.monthMode.state = (prefs.monthMode ? NSOnState : NSOffState);
	self.yearMode.state = (prefs.monthMode ? NSOffState : NSOnState);
	
	self.startFromMonday.state = (prefs.startFromMonday ? NSOnState : NSOffState);

	self.calendarView.wantsLayer = YES;
	[self.calendarView.layer setBorderWidth: 2];
	[self.calendarView.layer setCornerRadius: 10];
	
	//		self.calendarViewController = [[GMCalendarViewController alloc] initWithView:self.calendarView];
	self.calendarViewController = [[GMCalendarViewController alloc] init];
	self.calendarViewController.view.frame = CGRectMake(0, 0,
											 self.calendarView.frame.size.width,
											   self.calendarView.frame.size.height);
												   
	[self.calendarView addSubview:self.calendarViewController.view];
	
	self.calendarViewController.currentDate = [NSDate date];
	
	[self.calendarViewController reloadData];
	
	
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

- (IBAction)monthModeChanged:(id)sender
{
	if (sender == self.monthMode) {
		prefs.monthMode = YES;
	} else {
		prefs.monthMode = NO;
	}
	self.monthMode.state = (prefs.monthMode ? NSOnState : NSOffState);
	self.yearMode.state = (prefs.monthMode ? NSOffState : NSOnState);
	
	[self.calendarViewController reloadData];
	
}

- (IBAction)startFromMondayChanged:(id)sender
{
	prefs.startFromMonday = (self.startFromMonday.state == NSOnState ? YES : NO);
	[self.calendarViewController reloadData];
}
@end
