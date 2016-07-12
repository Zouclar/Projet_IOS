//
//  ViewController.m
//  MyTrello
//
//  Created by Thomas Nakache on 11/07/2016.
//  Copyright © 2016 Thomas Nakache. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

@interface ViewController ()

@end

@implementation ViewController
// .transform = CGAffineTransformMakeRotation(30 * M_PI / 180.0);

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSString *fullURL = @"https://trello.com/1/connect?key=1750ece02327997692ab493e0d299767&name=MyTrello&response_type=token&scope=read,write";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_ViewWeb loadRequest:requestObj];
    
    self.ViewWeb.delegate = self;
//    NSString* cc = [self.ViewWeb stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('pre')[0].contentText"];
//    NSLog(@"%@", cc);
}

-(void)webViewDidFinishLoad:(UITableView *) webView
{
    if([self.ViewWeb.request.mainDocumentURL isEqual: [NSURL
        URLWithString:@"https://trello.com/1/token/approve"]]){
        NSLog(@"Get token ready !");
        NSString *token = [self.ViewWeb stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('pre')[0].textContent"];
        self.ViewWeb.hidden = YES;
        NSLog(@"Token = %@", token);
    }
}




//NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.trello.com/1/member/me/boards?token=91dc5ab2192ca43240269569a655c112034e7645533ac8b8fcead06348772ba9&key=1750ece02327997692ab493e0d299767"]
//                                                       cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                   timeoutInterval:10.0];
//[request setHTTPMethod:@"GET"];
//[request setAllHTTPHeaderFields:headers];
//
//NSURLSession *session = [NSURLSession sharedSession];
//NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
//                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                                                if (error) {
//                                                    NSLog(@"%@", error);
//                                                } else {
//                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
//                                                    NSLog(@"%@", httpResponse);
//                                                }
//                                            }];
//[dataTask resume];



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
