//
//  ViewController.h
//  MyTrello
//
//  Created by Thomas Nakache on 11/07/2016.
//  Copyright © 2016 Thomas Nakache. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *ViewWeb;
@property (nonatomic) NSString *token;

@end

