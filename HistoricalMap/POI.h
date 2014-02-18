//
//  POI.h
//  HistoricalMap
//
//  Created by Student on 12/7/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface POI : NSObject

@property (strong, nonatomic) NSString *pointTitle;

@property (strong, nonatomic) NSString *description;

@property (strong, nonatomic) UIImage *image;

@property (strong, nonatomic) MKPointAnnotation *point;

@property (strong, nonatomic) NSString *genre;

+ (NSArray *)validGenres;

@end
