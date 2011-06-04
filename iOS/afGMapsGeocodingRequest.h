//
//  afGoogleMapsGeocodingWS.h
//  g2park
//
//  Created by adrien ferré on 20/05/11.
//  Copyright 2011 Ferré. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "afGoogleMapsAPIRequest.h"

#define GOOGLE_GEOCODING_API_PATH_COMPONENT @"geocode"

@protocol afGoogleMapsGeocodingDelegate;

@interface afGMapsGeocodingRequest : afGoogleMapsAPIRequest{
    
    id <afGoogleMapsGeocodingDelegate> afDelegate;
    
    BOOL reverseGeocoding;
    
    NSString *address;
    
    NSString *latlng;
    
    BOOL useBounds;

    CGPoint boundsP1;
    
    CGPoint boundsP2;
}

@property (nonatomic,assign) id<afGoogleMapsGeocodingDelegate> afDelegate;
@property (nonatomic,assign) BOOL reverseGeocoding;
@property (nonatomic,assign) BOOL useBounds;
@property (nonatomic,retain) NSString *address;
@property (nonatomic,retain) NSString *latlng;
@property (nonatomic,assign) CGPoint boundsP1;
@property (nonatomic,assign) CGPoint boundsP2;

+ (id) geocodingRequest;

- (id) initDefault;

+ (id) addressForLatitude:(double) lat andLongitude:(double)lng;

- (id) requestAddressForLatitude:(double) lat andLongitude:(double) lng;

+ (id) coordinatesForAddress:(NSString *)address;

- (id) requestCoordinatesForAddress:(NSString *)address;

- (NSURL *) makeURL;

- (void) setBoundsUpperLeft:(CGPoint) p1 downRight:(CGPoint)p2;

- (void) setLatitude:(double)lat andLongitude:(double)lng;

- (void) setTheAddress:(NSString *)taddress;

@end

@protocol afGoogleMapsGeocodingDelegate <NSObject>

@required

@optional

-(void) afGeocodingWSStarted:(afGMapsGeocodingRequest *)ws;

-(void) afGeocodingWSFailed:(afGMapsGeocodingRequest *)ws withError:(NSString *)er;

-(void) afGeocodingWS:(afGMapsGeocodingRequest *)ws gotLatitude:(double) latitude andLongitude:(double)longitude;

-(void) afGeocodingWS:(afGMapsGeocodingRequest *)ws gotAddress:(NSString *)address;

@end