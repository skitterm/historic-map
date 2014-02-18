//
//  Places.m
//  HistoricalMap
//
//  Created by Student on 12/7/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "Places.h"

@implementation Places

- (NSMutableArray *)poiList {
    if (!_poiList) {
        _poiList = [[NSMutableArray alloc] init];
    }
    return _poiList;
}

@end
