//
//  TicketNumbersTableViewController.h
//  Jackpot
//
//  Created by Gregory Weiss on 7/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimeSetDelegate

- (void)timeValueWasChosen:(NSInteger*)timeValue; // goes in this header cause it will receive data


@end

@interface TicketNumbersTableViewController : UITableViewController

@end
