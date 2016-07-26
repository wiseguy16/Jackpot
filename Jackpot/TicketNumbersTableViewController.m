//
//  TicketNumbersTableViewController.m
//  Jackpot
//
//  Created by Gregory Weiss on 7/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "TicketNumbersTableViewController.h"
#import "Ticket.h"
#import "WinningTicketViewController.h"

@interface TicketNumbersTableViewController ()

//@property (strong, nonatomic) Ticket *nTicket;

@property (strong, nonatomic) NSMutableArray *lotteryTicketsGeneratedArray;

- (IBAction)addTicketTapped:(UIBarButtonItem *)sender;

@end

@implementation TicketNumbersTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
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
 //   [self generateLotteryTicketNumbers];*****************MAKE THIS WORK!!!!
   
        Ticket *aTicket = [[Ticket alloc] init];
    
    
    // returns value to be displayed, so update the displayLabel
    
        [self.lotteryTicketsGeneratedArray addObject:aTicket];
    
    [self.tableView reloadData];
    
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
    Ticket *aTicket = self.lotteryTicketsGeneratedArray[indexPath.row]; // ****************MAKE THIS WORK!!!!
    cell.textLabel.text = aTicket.ticketAs6Digits;  // ****************MAKE THIS WORK!!!!
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
