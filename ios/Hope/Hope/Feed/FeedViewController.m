//
//  FeedViewController.m
//  Hope
//
//  Created by Danut on 10/20/18.
//  Copyright © 2018 Dana Bucadana. All rights reserved.
//

#import "FeedViewController.h"
#import "Utils.h"
#import "Constants.h"

@interface FeedViewController ()

@end

@implementation FeedViewController
@synthesize webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [Utils getNavTitleView:@"Hope"];
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    NSString *url1 = @"https://mihaiudrea.github.io/hope/demo/feed.html";
    NSURL *nsUrl = [NSURL URLWithString:url1];
    NSURLRequest *request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [webView loadRequest:request];
    [self.view addSubview:webView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
