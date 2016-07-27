//
//  TicketNumbersTableViewController.m
//  Jackpot
//
//  Created by Gregory Weiss on 7/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "TicketNumbersTableViewController.h"

#import "WinningTicketViewController.h"

@interface TicketNumbersTableViewController () //<TimeSetDelegate>

{
    NSInteger currentTimerValue; // instance variable
    NSInteger originalTimerValue;
    NSTimer *timer;
}


//@property (strong, nonatomic) Ticket *nTicket;

@property (strong, nonatomic) NSMutableArray *lotteryTicketsGeneratedArray;

- (IBAction)addTicketTapped:(UIBarButtonItem *)sender;

@end

@implementation TicketNumbersTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  //  [Ticket checkForWinningNumbers];
    
    self.lotteryTicketsGeneratedArray = [[NSMutableArray alloc] init];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Handlers

- (IBAction)addTicketTapped:(UIBarButtonItem *)sender
{
    
        Ticket *aTicket = [[Ticket alloc] init];
 //   [aTicket checkForWinningNumbers:<#(NSArray *)#>
    
    
    // returns value to be displayed, so update the displayLabel
    
        [self.lotteryTicketsGeneratedArray addObject:aTicket];
    
    [self.tableView reloadData];
    
    
   // [aTicket checkForWinningNumbers: //winningDigits
    
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.lotteryTicketsGeneratedArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Ticket *aTicket = self.lotteryTicketsGeneratedArray[indexPath.row]; // ****************MAKE THIS WORK!!!!*****WORKS NOW!
    cell.textLabel.text = aTicket.ticketAs6Digits;  // ****************MAKE THIS WORK!!!!*****WORKS NOW!
    
    return cell;
}


#pragma mark - Time Set delegate *****************************

- (void)winningTicketWasChosen:(Ticket *)winTicket
{
   // originalTimerValue = *timeValue;
   // currentTimerValue = originalTimerValue;
   // self.timeLabel.text = [NSString stringWithFormat:@"%ld sec", (long)currentTimerValue];
}




#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CheckTicketSegue"])
    {
        WinningTicketViewController *winTicketVC = [segue destinationViewController];
        winTicketVC.delegate = self;
    }
}


@end
