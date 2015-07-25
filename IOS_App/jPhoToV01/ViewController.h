//
//  ViewController.h
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2/7/2014.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MPVolumeView.h>

@interface ViewController : UIViewController
@property AVAudioPlayer *avPlayer;


-(void) UpdateTimer;

@end
