//
//  ViewController.m
//  Jackpot
//
//  Created by Gregory Weiss on 7/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "WinningTicketViewController.h"


@interface WinningTicketViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *timePicker;

@end

@implementation WinningTicketViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.winningNumbersArray2 = [[NSMutableArray alloc] init];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action Handlers

- (IBAction)cancelTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)setTapped:(UIButton *)sender
{
    
    // ********** Sloppy way to populate the winningNumbersArray2 with the winning numbers from the picker
    NSInteger firstSelectedRow = [self.timePicker selectedRowInComponent:0];
    NSInteger firstSelectedNumber = firstSelectedRow + 1;
    NSNumber *firstSelectedNSNumber = [NSNumber numberWithInteger:firstSelectedNumber];
    [self.winningNumbersArray2 addObject:firstSelectedNSNumber];
    
    NSInteger secondSelectedRow = [self.timePicker selectedRowInComponent:1];
    NSInteger secondSelectedNumber = secondSelectedRow + 1;
    NSNumber *secondSelectedNSNumber = [NSNumber numberWithInteger:secondSelectedNumber];
    [self.winningNumbersArray2 addObject:secondSelectedNSNumber];
    
    NSInteger thirdSelectedRow = [self.timePicker selectedRowInComponent:2];
    NSInteger thirdSelectedNumber = thirdSelectedRow + 1;
    NSNumber *thirdSelectedNSNumber = [NSNumber numberWithInteger:thirdSelectedNumber];
    [self.winningNumbersArray2 addObject:thirdSelectedNSNumber];
    
    NSInteger fourthSelectedRow = [self.timePicker selectedRowInComponent:3];
    NSInteger fourthSelectedNumber = fourthSelectedRow + 1;
    NSNumber *fourthSelectedNSNumber = [NSNumber numberWithInteger:fourthSelectedNumber];
    [self.winningNumbersArray2 addObject:fourthSelectedNSNumber];
    
    NSInteger fifthSelectedRow = [self.timePicker selectedRowInComponent:4];
    NSInteger fifthSelectedNumber = fifthSelectedRow + 1;
    NSNumber *fifthSelectedNSNumber = [NSNumber numberWithInteger:fifthSelectedNumber];
    [self.winningNumbersArray2 addObject:fifthSelectedNSNumber];
    
    NSInteger sixthSelectedRow = [self.timePicker selectedRowInComponent:5];
    NSInteger sixthSelectedNumber = sixthSelectedRow + 1;
    NSNumber *sixthSelectedNSNumber = [NSNumber numberWithInteger:sixthSelectedNumber];
    [self.winningNumbersArray2 addObject:sixthSelectedNSNumber];
    
    
    Ticket *theWinningTicket = [[Ticket alloc] init];
    
    theWinningTicket.winningTicketArray = self.winningNumbersArray2;
    
    // ********** This calls the required winningTicketWasChosen method and takes the "theWinningTicket" argument and passes it along to TicketNumbersTableViewController
    
    [self.delegate winningTicketWasChosen:theWinningTicket];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - Data Source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 6;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 53;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [NSString stringWithFormat:@"%ld", (long)row + 1];
}


@end