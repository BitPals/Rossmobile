//
//  MapViewController.m
//  RossMobile
//
//  Created by Piotrek on 9/11/12.
//
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:NSLocalizedString(@"Nearby Rossman's", nil)];

    _radius = 6000;
   
    _mapView = [[MKMapView alloc] init];
    [_mapView setShowsUserLocation:YES];
    [_mapView setDelegate:self];
    [self.view addSubview:_mapView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_mapView setFrame:self.view.frame];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - RestKit

- (void)sendRequest {
    NSString* key = @"AIzaSyDCjvRSUdW22BXAmMJsa7udpOvu-n4ZPUw";
    CLLocationCoordinate2D currentLocation = _mapView.userLocation.coordinate;
    
    NSString * urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=rossman&location=%f,%f&radius=%f&sensor=false&key=%@",currentLocation.latitude, currentLocation.longitude, _radius, key];
    
    _rossmanRequest = [[RKRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    [_rossmanRequest setMethod:RKRequestMethodGET];
    [_rossmanRequest setDelegate:self];
    [_rossmanRequest send];
}

- (void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response {
    NSError* error;
    NSDictionary* parsedBody = [response parsedBody:&error];
    
    NSArray* results = [parsedBody objectForKey:@"results"];
  
    for (NSDictionary* rossman in results) {
        
        NSDictionary* location = [[rossman objectForKey:@"geometry"] objectForKey:@"location"];
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([[location objectForKey:@"lat"] floatValue],
                                                                       [[location objectForKey:@"lng"] floatValue]);
        
        RossmanAnnotation* annotation = [[RossmanAnnotation alloc] initWithCoordinates:coordinate
                                                                             placeName:[rossman objectForKey:@"formatted_address"]];
        
        [_mapView addAnnotation:annotation];
    }    
}

#pragma mark - MKMapView Delegate 

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id) annotation
{
    if (annotation == _mapView.userLocation) {
        [_mapView.userLocation setTitle:NSLocalizedString(@"You are Here!",nil)];
        return nil;
    }
    
    MKPinAnnotationView *newAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"rossmanPin"];
    newAnnotation.animatesDrop = YES;
    newAnnotation.canShowCallout = YES;
    return newAnnotation;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    [_mapView setRegion:MKCoordinateRegionMakeWithDistance(userLocation.coordinate, _radius, _radius) animated:YES];
    [self sendRequest];
}

@end
