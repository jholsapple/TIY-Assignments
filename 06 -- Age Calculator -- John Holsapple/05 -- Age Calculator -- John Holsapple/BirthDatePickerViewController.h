//
//  BirthDatePickerViewController.h
//  05 -- Age Calculator -- John Holsapple
//
//  Created by John Holsapple on 6/22/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculateAgeViewController.h"

@interface BirthDatePickerViewController : UIViewController

@property (strong, nonatomic) id<BirthDatePickerDelegate> delegate;

@end


