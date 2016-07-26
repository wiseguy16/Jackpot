//
//  Ticket.m
//  Jackpot
//
//  Created by Gregory Weiss on 7/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
        _ticketDigitsArray = [[NSMutableArray alloc] init];
        _ticketAs6Digits = [[NSString alloc] init];
        
        [self generateLotteryTicketNumbers];
        
  //      _operand2String = [[NSMutableString alloc] init];
  //      _operatorType = OperatorTypeNone;
    }
    
    return self;
}


-(NSString*)generateLotteryTicketNumbers
{
    // do something
    NSNumber *numberX = [self randomDigit];
    
    [self.ticketDigitsArray addObject:numberX];
    self.ticketAs6Digits = [NSString stringWithFormat:@"%@", numberX];
    return self.ticketAs6Digits;
}

-(NSNumber *)randomDigit 
 {
    int random = arc4random_uniform(54) + 1;
     NSNumber *randomNSNumber = [NSNumber numberWithInteger:random];
     
     // NSNumber *yourNumber = [NSNumber numberWithInt:your_int_variable];
 
    return randomNSNumber;
}
 



@end
