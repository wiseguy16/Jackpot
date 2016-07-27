//
//  TicketNumbersTableViewController.m
//  Jackpot
//
//  Created by Gregory Weiss on 7/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "TicketNumbersTableViewController.h"

#import "WinningTicketViewController.h"

@interface TicketNumbersTableViewController () <WinningTicketDelegate>

{
    NSInteger currentTimerValue; // instance variable
    NSInteger originalTimerValue;
    NSTimer *timer;
    Ticket *winningTicket;
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
        self.tempArray = [[NSArray alloc] init];
    
    self.lotteryTicketsGeneratedArray = [[NSMutableArray alloc] init];
    
    

}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
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
    cell.detailTextLabel.text = aTicket.prizeMoney;
    
    if (aTicket.winner)
    {
        cell.backgroundColor = [UIColor greenColor];
    }
    else
    {
        cell.backgroundColor = [UIColor clearColor];
    }
    
    return cell;
}


#pragma mark - Time Set delegate *****************************

- (void)winningTicketWasChosen:(Ticket *)winTicket
{
    
    winningTicket = winTicket;
    for (Ticket *ticket in self.lotteryTicketsGeneratedArray)
    {
        [ticket checkForWinningNumbers:winningTicket.winningTicketArray];
    }
    
    //self.tempArray = winTicket.winningTicketArray;
    //[winTicket checkForWinningNumbers:winTicket.winningTicketArray];
    [self.tableView reloadData];
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


//- (void)returnThePickedNumbers:(NSArray *)pickedNumbers {
//    [self checkWinners:pickedNumbers];
//}



//- (void)checkWinners:(NSArray *)pickedNumbers {
//    // Create a winning ticket
//    Ticket *winningTicket = [Ticket ticketUsingArray:pickedNumbers];
//    
//    totalWinnings = 0;
//    for (Ticket *ourTicket in tickets) {
//        [ourTicket compareWithTicket:winningTicket];
//        totalWinnings += ourTicket.payout;
//    }


@end
