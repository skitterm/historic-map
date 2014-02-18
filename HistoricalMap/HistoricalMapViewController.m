//
//  HistoricalMapViewController.m
//  HistoricalMap
//
//  Created by Student on 12/5/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "HistoricalMapViewController.h"
#import "EnterPlaceInfoVC.h"
#import "GenreListTVC.h"
#import "POI.h"

@interface HistoricalMapViewController ()

@property (strong, nonatomic) UITapGestureRecognizer *recognizer;

@property (strong, nonatomic) NSArray *imageStrings;

@property (strong, nonatomic) POI *tappedPoint;

@property (nonatomic) NSInteger imageIndex;

@end

@implementation HistoricalMapViewController

@synthesize mapView;

- (POI *)tappedPoint {
    if (!_tappedPoint) {
        _tappedPoint = [[POI alloc] init];
    }
    return _tappedPoint;
}


- (Places *)places {
    if (!_places) {
        _places = [[Places alloc] init];
    }
    return _places;
}

- (NSInteger)imageIndex {
    if (!_imageIndex) {
        _imageIndex = 0;
    } else if(_imageIndex > [self.imageStrings count] - 1) {
        _imageIndex = 0;
    }
    return _imageIndex;
}


- (NSArray *)imageStrings {
    if (!_imageStrings) {
        _imageStrings = @[@"sunset.jpg",@"vintagebuilding.jpg",@"mountains.jpg",@"glacier.jpg",@"hawaiifield.jpg",@"citysubway.jpg"];
    }
    return _imageStrings;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.mapView.delegate = self;
    
}


- (IBAction)cancelToThisVC:(UIStoryboardSegue *)unwindSegue {
    
}

//if we saved in the modal view
- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue {
    
    //now that our point is created with a title and description, we'll add it to the map.
    EnterPlaceInfoVC *epiVC = (EnterPlaceInfoVC *)unwindSegue.sourceViewController;
    POI *poi = epiVC.point;
    
    [self.places.poiList addObject:poi];
    
    poi.point.title = poi.pointTitle;

    [self.mapView addAnnotation:poi.point];
    [self.mapView selectAnnotation:poi.point animated:NO];
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 10000,10000);
    [self.mapView setRegion:region animated:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

        //Pass the list the array of places
        if ([segue.identifier isEqualToString:@"toList"]) {
            GenreListTVC *glTvc = (GenreListTVC *)segue.destinationViewController;
            glTvc.places = self.places;
        } else if([segue.identifier isEqualToString:@"editPoint"]) {
            //on tap, make a point, and pass it to the modal view to set its title and description.
            UITapGestureRecognizer *tapRecog = (UITapGestureRecognizer *)sender;
            if (tapRecog.state == UIGestureRecognizerStateRecognized) {
                CGPoint touchSpot = [tapRecog locationInView:self.view];
                CLLocationCoordinate2D touchCoord = [self.mapView convertPoint:touchSpot toCoordinateFromView:self.view];
                
                //add annotation
                MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
                point.coordinate = touchCoord;
                
                self.tappedPoint.point = point;
                UIImage *image = [UIImage imageNamed:[self.imageStrings objectAtIndex:self.imageIndex]];
                self.imageIndex++;
                self.tappedPoint.image = image;
                self.tappedPoint.genre = [POI validGenres][0];
                
                UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
                EnterPlaceInfoVC *epiVC = (EnterPlaceInfoVC *)nav.topViewController;
                epiVC.point = self.tappedPoint;
            }
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

