//
//  SMSTableViewCell.m
//  SMS Scheduler
//
//  Created by  Diyan Zhekov on 9/24/15.
//  Copyright © 2015 dmbTeam. All rights reserved.
//

#import "SMSTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "SMSColors.h"

NSString * const kSMSCellIdentifier = @"smsCell";

@interface SMSTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *recepient;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *messageText;
@property (weak, nonatomic) IBOutlet UILabel *smsNotSentLabel;
@property (weak, nonatomic) IBOutlet UIView *repeatIcon;
@property (weak, nonatomic) IBOutlet UILabel *repeatLabel;

@end

@implementation SMSTableViewCell

+ (void)registerNibInTableView:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:kSMSCellIdentifier];
}

+ (SMSTableViewCell *)dequereCellInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath sms:(SMS *)sms {
    
    SMSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSMSCellIdentifier forIndexPath:indexPath];
    
    [cell setSMS:sms];
    
    return cell;
    
}

- (void)setSMS:(SMS *)sms {
    
    self.recepient.text         = sms.recepientName;
    
    self.recepient.textColor    = [SMSColors defaultColor];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"MMM dd, yyyy - HH:mm"];
    
    self.smsNotSentLabel.text = NSLocalizedString(@"NotSentKey", nil);
    self.smsNotSentLabel.textColor = [SMSColors alertColor];
    self.smsNotSentLabel.hidden = (sms.sent == NO && [sms.date timeIntervalSinceNow] < 0) ? NO : YES;

    
    self.date.text         = [dateFormatter stringFromDate:sms.date];
    self.date.textColor         = [SMSColors text];
    
    self.messageText.text       = sms.text;
    self.messageText.textColor  = [SMSColors text];
    
    self.repeatIcon.layer.cornerRadius = self.repeatIcon.bounds.size.width/2;
    self.repeatIcon.layer.masksToBounds = YES;
    self.repeatIcon.backgroundColor = [SMSColors defaultColor];
    self.repeatLabel.textColor = [UIColor whiteColor];
    
    if ([sms.repeatInterval isEqualToString:NSLocalizedString(@"DailyRepeatKey", nil)]) {
        
        self.repeatLabel.text = NSLocalizedString(@"DailyShortKey", nil);
        
    } else if ([sms.repeatInterval isEqualToString:NSLocalizedString(@"WeeklyRepeatKey", nil)]) {
        
        self.repeatLabel.text = NSLocalizedString(@"WeeklyShortKey", nil);
        
    } else if ([sms.repeatInterval isEqualToString:NSLocalizedString(@"MonthlyRepeatKey", nil)]) {
        
        self.repeatLabel.text = NSLocalizedString(@"MonthlyShortKey", nil);
        
    } else if ([sms.repeatInterval isEqualToString:NSLocalizedString(@"YearlyRepeatKey", nil)]) {
        
        self.repeatLabel.text = NSLocalizedString(@"YearlyShortKey", nil);
    }
}

+ (NSString *)identifier {
    return kSMSCellIdentifier;
}

@end
