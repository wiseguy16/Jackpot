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
    // [self dismissViewControllerAnimated:YES completion:nil];
    NSInteger selectedRow = [self.timePicker selectedRowInComponent:0];
    [self.delegate timeValueWasChosen:53 - selectedRow];
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

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%ld", (long)53 -row];
}

@end