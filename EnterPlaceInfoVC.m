//
//  EnterPlaceInfoVC.m
//  HistoricalMap
//
//  Created by Student on 12/12/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "EnterPlaceInfoVC.h"

@interface EnterPlaceInfoVC () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleText;
@property (weak, nonatomic) IBOutlet UITextField *descText;
@property (weak, nonatomic) IBOutlet UIPickerView *genrePicker;

@end

@implementation EnterPlaceInfoVC

- (POI *)point {
    if (!_point) {
        _point = [[POI alloc] init];
    }
    return _point;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //set all of the input fields to our point object.
    self.point.pointTitle = self.titleText.text;
    self.point.description = self.descText.text;
    NSInteger genreIndex = [self.genrePicker selectedRowInComponent:0];
    NSString *genreString = [[POI validGenres] objectAtIndex:genreIndex];
    self.point.genre = genreString;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.genrePicker.dataSource = self;
    self.genrePicker.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

//dismiss the keyboard when we click outside of descText textfield
- (void)dismissKeyboard {
    [self.descText resignFirstResponder];
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[POI validGenres] objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[POI validGenres] count];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
