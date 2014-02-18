//
//  GenreListTVC.m
//  HistoricalMap
//
//  Created by Student on 12/12/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "GenreListTVC.h"
#import "POI.h"
#import "PointsListTVC.h"

@interface GenreListTVC ()

@end

@implementation GenreListTVC

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)titleAtIndex:(NSInteger)row {
    return [POI validGenres][row];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[POI validGenres] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"genre";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self titleAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    PointsListTVC *plTvc = (PointsListTVC *)segue.destinationViewController;
    UITableViewCell *senderCell = (UITableViewCell *)sender;
    NSMutableArray *genreSpecPoints = [[NSMutableArray alloc] init];
    NSString *cellTitle = senderCell.textLabel.text;
    
    //if the points' genres are the same as this one, send them on.
    for (int i=0; i < [self.places.poiList count]; i++) {
        POI *point = self.places.poiList[i];
        if ([point.genre isEqualToString:cellTitle]) {
            [genreSpecPoints addObject:point];
        }
    }
    
    plTvc.places = self.places;
    plTvc.places.poiList = genreSpecPoints;
}





















@end
