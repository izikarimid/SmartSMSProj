//
//  SMSTableViewCell.h
//  SMS Scheduler
//
//  Created by  Diyan Zhekov on 9/24/15.
//  Copyright © 2015 dmbTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMS.h"

extern NSString * const __nonnull kSMSCellIdentifier;

@interface SMSTableViewCell : UITableViewCell

+ (void)registerNibInTableView:(UITableView * __nonnull)tableView;
+ (SMSTableViewCell * __nonnull)dequereCellInTableView:(UITableView * __nonnull)tableView indexPath:(NSIndexPath * __nonnull)indexPath sms:(SMS * __nonnull)sms;

- (void)setSMS:(SMS * __nonnull)sms;

+ (NSString * __nonnull)identifier;

@end
