//
//  Ticket.h
//  Jackpot
//
//  Created by Gregory Weiss on 7/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property (strong, nonatomic) NSMutableArray *ticketDigitsArray;

@property (assign) NSNumber *digit1;
@property (assign) NSNumber *digit2;
@property (assign) NSNumber *digit3;
@property (assign) NSNumber *digit4;
@property (assign) NSNumber *digit5;
@property (assign) NSNumber *digit6;
@property (strong, nonatomic) NSString *ticketAs6Digits;

-(NSNumber *)randomDigit;
-(NSString*)generateLotteryTicketNumbers;

@end
