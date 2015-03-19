//
//  LocationViewController.h
//  DataCollector
//
//  Created by allen on 17/03/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface LocationViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic)
CLLocation *location;
@end
