//
//  afGMapsPlaceSearchesRequest.h
//  afGMDemo
//
//  Created by adrien ferré on 01/10/11.
//  Copyright 2011 Ferré. All rights reserved.
//

#import "afGMapsPlacesRequest.h"

@protocol afGoogleMapsPlaceSearchesDelegate;

@interface afGMapsPlaceSearchesRequest : afGMapsPlacesRequest

@property (nonatomic,assign) id<afGoogleMapsPlaceSearchesDelegate> afDelegate;

@end

@protocol afGoogleMapsPlaceSearchesDelegate <NSObject>
@optional

@end