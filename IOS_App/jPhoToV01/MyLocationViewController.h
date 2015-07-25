//
//  MyLocationViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-23.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MyLocationViewController : UIViewController
<CLLocationManagerDelegate, MKMapViewDelegate, UIAlertViewDelegate>
{
    CLLocationManager *manager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)findMe:(id)sender;

@end
