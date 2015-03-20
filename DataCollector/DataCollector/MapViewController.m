//
//  MapViewController.m
//  DataCollector
//
//  Created by allen on 19/03/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import "UIView+XLFormAdditions.h"
#import <MapKit/MapKit.h>

#import "MapViewController.h"


@interface MapAnnotation : NSObject  <MKAnnotation>
@end

@implementation MapAnnotation
@synthesize coordinate = _coordinate;
-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    _coordinate = newCoordinate;
}
@end

@interface MapViewController () <MKMapViewDelegate>

@property (nonatomic) MKMapView * mapView;

@end

@implementation MapViewController

@synthesize rowDescriptor = _rowDescriptor;

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
    // Do any additional setup after loading the view.
    [self.view addSubview:self.mapView];
    self.mapView.delegate = self;
    if (self.rowDescriptor.value){
        [self.mapView setCenterCoordinate:((CLLocation *)self.rowDescriptor.value).coordinate];
        self.title = [NSString stringWithFormat:@"%0.4f, %0.4f", self.mapView.centerCoordinate.latitude, self.mapView.centerCoordinate.longitude];
        MapAnnotation *annotation = [[MapAnnotation alloc] init];
        annotation.coordinate = self.mapView.centerCoordinate;
        [self.mapView addAnnotation:annotation];
    }
}

-(MKMapView *)mapView
{
    if (_mapView) return _mapView;
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    return _mapView;
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation {
    
    MKPinAnnotationView *pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                                             reuseIdentifier:@"annotation"];
    pinAnnotationView.pinColor = MKPinAnnotationColorRed;
    pinAnnotationView.draggable = YES;
    pinAnnotationView.animatesDrop = YES;
    return pinAnnotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
   fromOldState:(MKAnnotationViewDragState)oldState
{
    if (newState == MKAnnotationViewDragStateEnding){
        self.rowDescriptor.value = [[CLLocation alloc] initWithLatitude:view.annotation.coordinate.latitude longitude:view.annotation.coordinate.longitude];
        self.title = [NSString stringWithFormat:@"%0.4f, %0.4f", view.annotation.coordinate.latitude, view.annotation.coordinate.longitude];
    }
}


@end

