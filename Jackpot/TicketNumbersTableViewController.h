//
//  TicketNumbersTableViewController.h
//  Jackpot
//
//  Created by Gregory Weiss on 7/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@protocol WinningTicketDelegate

- (void)winningTicketWasChosen:(Ticket *)winTicket; // goes in this header cause it will receive data


@end

@interface TicketNumbersTableViewController : UITableViewController

@end
