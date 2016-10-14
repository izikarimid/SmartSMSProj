//
//  SMSManager.h
//  SMS Scheduler
//
//Created by ilabafrica on 24/08/2016.
// Copyright © 2016 Strathmore. All rights reserved.

//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SMS.h"

@interface SMSManager : NSObject

+ (SMSManager *)sharedManager;

- (NSArray *)scheduledSMSs;
- (NSArray *)sentSMSs;
- (NSArray *)allSMSs;

- (void)scheduleSMSWithRecepients:(NSArray *)recepients phones:(NSArray *)phones date:(NSDate *)date message:(NSString *)message repeatInterval:(NSString *)repeatInterval;

- (void)rescheduleSMS:(SMS *)sms;

@end 
