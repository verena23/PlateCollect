//
//  FGViewController.h
//  PlateCollect
//
//  Created by Finn Gaida on 07.09.13.
//  Copyright (c) 2013 Finn Gaida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "FGStuffCalculator.h"
#import "FGAnnotation.h"

@interface FGViewController : UIViewController <MKMapViewDelegate> {
    
    // For the side menu
    UIButton *profile;
    UIButton *settings;
    UIButton *credits;
    
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end
