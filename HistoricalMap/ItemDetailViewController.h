//
//  ItemDetailViewController.h
//  HistoricalMap
//
//  Created by Student on 12/7/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "POI.h"

@interface ItemDetailViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) POI *poi;

@end
