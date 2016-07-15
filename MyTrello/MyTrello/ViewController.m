//
//  ViewController.m
//  MyTrello
//
//  Created by Thomas Nakache on 11/07/2016.
//  Copyright © 2016 Thomas Nakache. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import "MainTableViewController.h"

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
       // NSLog(@"Get token ready !");
        NSString *token = [self.ViewWeb stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('pre')[0].textContent.replace(/\\s/g,'')"];
        //IF TOKEN == TRUE ALORS:
        [self setToken:token];
        if (token) {
            
            [self presentViewController:toto animated:YES completion:nil];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"tokenSegue"]){
        MainTableViewController *list = (MainTableViewController *) segue.MainTableViewController;
        list.isSomethingEnabled = YES;
    }
}

@end
