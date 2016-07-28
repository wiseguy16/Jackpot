//
//  ViewController.h
//  Jackpot
//
//  Created by Gregory Weiss on 7/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketNumbersTableViewController.h"
#import "Ticket.h"



@interface WinningTicketViewController : UIViewController

@property (strong, nonatomic) id<WinningTicketDelegate> delegate; // required for using the delegate

@property (strong, nonatomic) NSMutableArray *winningNumbersArray2;

@property (strong, nonatomic) Ticket *possibleWinningTicket;


@end

