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
     }
    
    return self;
}


-(NSString*)generateLotteryTicketNumbers
{
    
    do
    {
        
        int random = arc4random_uniform(53) + 1;
        NSNumber *randomNSNumber = [NSNumber numberWithInteger:random];
        BOOL shouldAddNumber = YES;
        for (NSNumber *number in self.ticketDigitsArray)
        {
            if ([number isEqual:randomNSNumber])
            {
                shouldAddNumber = NO;
            }
        }
        if (shouldAddNumber)
        {
            [self.ticketDigitsArray addObject:randomNSNumber];
        }
        
    } while (self.ticketDigitsArray.count < 6);
    
    NSMutableString *formingTicketString = [[NSMutableString alloc] init];
    
    for (NSNumber *tempNum in self.ticketDigitsArray)
    {
        NSString *numAsString = [NSString stringWithFormat:@"%@ ", tempNum];
        [formingTicketString appendString:numAsString];
    }
    self.ticketAs6Digits = [NSString stringWithFormat:@"%@", formingTicketString];
    
    return self.ticketAs6Digits;
    
}

-(int)checkForWinningNumbers:(NSArray*)winningNumbersArray
{
    int winCount = 0;
    for (NSNumber *winningIndivNumber in winningNumbersArray)
    {
        for (NSNumber *potWinnerNumber in self.ticketDigitsArray) // 
        {
            if ([winningIndivNumber isEqual:potWinnerNumber])
            {
                winCount = winCount + 1;
            }
        }
    }
    
    if (winCount == 6)
    {
        self.prizeMoney = @"$100";
    }
    else if (winCount == 5)
    {
        self.prizeMoney = @"$20";
    }
    else if (winCount == 4)
    {
        self.prizeMoney = @"$5";
    }
    else if (winCount == 3)
    {
        self.prizeMoney = @"$1";
    }
    else
    {
      self.prizeMoney = @"";
    }

    
    
    return winCount;
}


    
/*        *****************Use this part of code******************
//    NSNumber *numberX = [self randomDigit];
    
//    [self.ticketDigitsArray addObject:numberX];
//    self.ticketAs6Digits = [NSString stringWithFormat:@"%@", numberX];
//    return self.ticketAs6Digits;
 */
    
    



@end
