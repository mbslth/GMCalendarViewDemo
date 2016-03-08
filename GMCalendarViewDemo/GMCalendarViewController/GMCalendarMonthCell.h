//
//  GMCalendarMonthCell.h
//  GMCalendarViewDemo
//
//  Created by Водолазкий В.В. on 08.03.16.
//  Copyright © 2016 Geomatix Laboratoriess S.R.O. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString * const VVVCalendarViewStartWeekDayChanged;

@interface GMCalendarMonthCell : NSCollectionViewItem <NSCollectionViewDelegate, NSCollectionViewDataSource>

@property (weak) IBOutlet NSTextField *monthLabel;
@property (nonatomic, readwrite) BOOL weekStartOnMonday;

@property (nonatomic, readwrite) NSInteger month;
@property (nonatomic, readwrite) NSInteger year;

@property (weak, nonatomic) IBOutlet NSCollectionView *dayCollection;


@end
