//
//  MyLocationViewController.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-23.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "MyLocationViewController.h"
#import "MapLocation.h"

@interface MyLocationViewController ()
- (void)openCallout:(id<MKAnnotation>)annotation;
- (void)reverseGeocode:(CLLocation *)location;
@end

@implementation MyLocationViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Method

- (IBAction)findMe:(id)sender
{
    if (manager == nil)
        manager = [[CLLocationManager alloc] init];
    
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    [manager startUpdatingLocation];
    
    self.progressBar.hidden = NO;
    self.progressBar.progress = 0.0;
    self.progressLabel.text = NSLocalizedString(@"Searching", @"Searching");
    
    self.button.hidden = YES;
}

#pragma mark - (Private) Instance Methods

- (void)openCallout:(id<MKAnnotation>)annotation
{
    self.progressBar.progress = 1.0;
    self.progressLabel.text = NSLocalizedString(@"Showing Annotation", @"Showing Annotation");
    [self.mapView selectAnnotation:annotation animated:YES];
}

- (void)reverseGeocode:(CLLocation *)location
{
    if (!geocoder)
        geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray* placemarks, NSError* error){
        if (nil != error)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error translating coordinates into location", @"Error translating coordinates into location")
                                                            message:NSLocalizedString(@"Geocoder did not recognize coordinates", @"Geocoder did not recognize coordinates")
                                                           delegate:self
                                                  cancelButtonTitle:NSLocalizedString(@"OK", @"OK")
                                                  otherButtonTitles:nil];
            [alert show];
            
        }
        else if ([placemarks count] > 0)
        {
            placemark = [placemarks objectAtIndex:0];
            
            self.progressBar.progress = 0.5;
            self.progressLabel.text = NSLocalizedString(@"Location Determined", @"Location Determined");
            
            MapLocation *annotation = [[MapLocation alloc] init];
            annotation.myStreet = placemark.thoroughfare;
            annotation.myCity = placemark.locality;
            annotation.myState = placemark.administrativeArea;
            annotation.myPostCode = placemark.postalCode;
            annotation.coordinate = location.coordinate;
            
            [self.mapView addAnnotation:annotation];
        }
    }];
}

#pragma mark - CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)aManager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if ([newLocation.timestamp timeIntervalSince1970] < [NSDate timeIntervalSinceReferenceDate] - 60)
        return;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 500, 500);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustedRegion animated:YES];
    
    aManager.delegate = nil;
    [aManager stopUpdatingLocation];
    
    self.progressBar.progress = 0.25;
    self.progressLabel.text = NSLocalizedString(@"Reverse Geocoding Location", @"Reverse Geocoding Location");
    
    [self reverseGeocode:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorType = (error.code == kCLErrorDenied)
    ? NSLocalizedString(@"Access Denied", @"Access Denied")
    : NSLocalizedString(@"Unknown Error", @"Unknown Error");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error getting Location", @"Error getting Location")
                                                    message:errorType
                                                   delegate:self
                                          cancelButtonTitle:NSLocalizedString(@"OK", @"OK")
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - MKMapViewDelegate Methods

- (MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *placemarkIdentifier = @"Map Location Identifier";
    if ([annotation isKindOfClass:[MapLocation class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[aMapView dequeueReusableAnnotationViewWithIdentifier:placemarkIdentifier];
        if (nil == annotationView)
        {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                             reuseIdentifier:placemarkIdentifier];
        }
        else
            annotationView.annotation = annotation;
        
        annotationView.enabled = YES;
        annotationView.animatesDrop = YES;
        annotationView.pinColor = MKPinAnnotationColorPurple;
        annotationView.canShowCallout = YES;
        
        [self performSelector:@selector(openCallout:) withObject:annotation afterDelay:0.5];
        
        self.progressBar.progress = 0.75;
        self.progressLabel.text = NSLocalizedString(@"Creating Annotation", @"Creating Annotation");
        
        return annotationView;
    }
    return nil;
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)aMapView withError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error loading map", @"Error loading map")
                                                    message:[error localizedDescription]
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", @"OK")
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - UIAlertViewDelegate Method

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.progressBar.hidden = YES;
    self.progressLabel.text = @"";
    self.button.hidden = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
