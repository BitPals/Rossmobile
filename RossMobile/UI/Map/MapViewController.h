//
//  MapViewController.h
//  RossMobile
//
//  Created by Piotrek on 9/11/12.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "RossmanAnnotation.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, RKRequestDelegate> {
    MKMapView* _mapView;
    RKRequest* _rossmanRequest;
    CGFloat _radius;
}

@end
