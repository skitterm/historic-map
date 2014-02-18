//
//  PointsListTVC.m
//  HistoricalMap
//
//  Created by Student on 12/5/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "PointsListTVC.h"
#import "ItemDetailViewController.h"
#import <MapKit/MapKit.h>

@interface PointsListTVC ()

@end

@implementation PointsListTVC

- (Places *)places {
    if (!_places) {
        _places = [[Places alloc] init];
    }
    return _places;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (POI *)poiForRow:(NSInteger)row {
    
    POI *poi = (POI *)self.places.poiList[row];
    return poi;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.places.poiList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"item";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    POI *poi = [self poiForRow:indexPath.row];
    cell.textLabel.text = poi.pointTitle;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ItemDetailViewController *idvc = (ItemDetailViewController *)segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    POI *poi = [self poiForRow:indexPath.row];
    idvc.poi = poi;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
