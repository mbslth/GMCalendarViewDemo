//
//  Preferences.h
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 07.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Preferences : NSObject



+ (Preferences *) sharedPreferences;

@property (nonatomic, readwrite) BOOL startFromMonday;

@property (nonatomic, readwrite) BOOL monthMode;

@end
