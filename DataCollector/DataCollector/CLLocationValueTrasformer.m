//
//  CLLocationValueTrasformer.m
//  DataCollector
//
//  Created by allen on 19/03/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "CLLocationValueTrasformer.h"

@implementation CLLocationValueTrasformer

+ (Class)transformedValueClass
{
    return [NSString class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (id)transformedValue:(id)value
{
    if (!value) return nil;
    CLLocation * location = (CLLocation *)value;
    return [NSString stringWithFormat:@"%0.4f, %0.4f", location.coordinate.latitude, location.coordinate.longitude];
}

@end