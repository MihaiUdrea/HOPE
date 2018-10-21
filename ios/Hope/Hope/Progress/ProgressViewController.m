//
//  ProgressViewController.m
//  Hope
//
//  Created by Dana Buca on 20/10/2018.
//  Copyright © 2018 Dana Bucadana. All rights reserved.
//

#import "ProgressViewController.h"
#import "Utils.h"
#import "Constants.h"

@interface ProgressViewController ()

@end

@implementation ProgressViewController
@synthesize webView;

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self.view setBackgroundColor:[UIColor greenColor]];
   self.navigationItem.titleView = [Utils getNavTitleView:@"Hope"];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
   // UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"progress.jpg"]];
   // [background setFrame:CGRectMake(0.0, 50.0, self.view.frame.size.width, self.view.frame.size.height-50)];
    
    NSString *url1 = @"https://mihaiudrea.github.io/hope/demo/progress.html";
    NSURL *nsUrl = [NSURL URLWithString:url1];
    NSURLRequest *request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    //[self.view addSubview:background];

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
