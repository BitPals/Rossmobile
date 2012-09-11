//
//  RossmanAnnotation.h
//  RossMobile
//
//  Created by Piotrek on 9/11/12.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface RossmanAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D _coordinate;
    NSString * _title;
    NSString * _subtitle;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subtitle;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location placeName:(NSString *)placeName;
@end