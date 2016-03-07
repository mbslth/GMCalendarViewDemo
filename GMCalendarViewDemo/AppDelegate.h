//
//  AppDelegate.h
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 07.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "GMCalendarViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, retain) GMCalendarViewController *calendarViewController;

@property (weak) IBOutlet NSView *calendarView;

@property (weak) IBOutlet NSButton *monthMode;
@property (weak) IBOutlet NSButton *yearMode;
- (IBAction)monthModeChanged:(id)sender;

@property (weak) IBOutlet NSButton *startFromMonday;
- (IBAction)startFromMondayChanged:(id)sender;

@end

