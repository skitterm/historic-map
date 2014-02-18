//
//  ItemDetailViewController.m
//  HistoricalMap
//
//  Created by Student on 12/7/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "ItemDetailViewController.h"

@interface ItemDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;

@end

@implementation ItemDetailViewController

@synthesize mapView;

- (POI *)poi {
    if (!_poi) {
        _poi = [[POI alloc] init];
    }
    return _poi;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleLabel.text = self.poi.pointTitle;
    self.descLabel.text = self.poi.description;
    self.itemImage.image = self.poi.image;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.poi.point.coordinate, 2000,2000);
    [self.mapView setRegion:region animated:YES];
    
    [self.mapView addAnnotation:self.poi.point];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
