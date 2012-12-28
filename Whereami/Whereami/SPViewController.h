//
//  SPViewController.h
//  Whereami
//
//  Created by Christopher Martin on 12/27/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SPViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@end
