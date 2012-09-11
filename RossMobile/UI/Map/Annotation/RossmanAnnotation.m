//
//  RossmanAnnotation.m
//  RossMobile
//
//  Created by Piotrek on 9/11/12.
//
//

#import "RossmanAnnotation.h"

@implementation RossmanAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location placeName:placeName{
    self = [super init];
    if (self != nil) {
        coordinate = location;
        title = placeName;
    }
    return self;
}

@end