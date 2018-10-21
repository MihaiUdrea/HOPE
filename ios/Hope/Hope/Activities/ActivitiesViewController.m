//
//  ActivitiesViewController.m
//  Hope
//
//  Created by Dana Buca on 20/10/2018.
//  Copyright © 2018 Dana Bucadana. All rights reserved.
//

#import "ActivitiesViewController.h"
#import "Utils.h"
#import "Constants.h"

@interface ActivitiesViewController ()

@end

@implementation ActivitiesViewController
@synthesize webView, imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self.view setBackgroundColor:[UIColor redColor]];
//    UIImageView* v = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    v.image = [UIImage imageNamed:@"progress.png"];
//    v.layer.cornerRadius  = 20.0;
//    v.clipsToBounds = YES;
//    v.layer.borderWidth = 30.0f;
//    v.layer.borderColor = [UIColor whiteColor].CGColor;
//    UIBarButtonItem* leftBtn = [[UIBarButtonItem alloc] initWithCustomView:v];
//    self.navigationItem.leftBarButtonItem = leftBtn;
    
    self.navigationItem.titleView = [Utils getNavTitleView:@"Hope"];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
    
    NSString *url1 = @"https://mihaiudrea.github.io/hope/demo/forest.html";
    NSURL *nsUrl = [NSURL URLWithString:url1];
    NSURLRequest *request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [webView loadRequest:request];
   // [webView loadRequest:[NSURLRequest requestWithURL:url]];
    //[webView loadHTMLString:htmlString baseURL: [[NSBundle mainBundle] bundleURL]];
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
