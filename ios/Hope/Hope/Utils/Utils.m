//
//  Utils.m
//  Hope
//
//  Created by Dana Buca on 20/10/2018.
//  Copyright © 2018 Dana Bucadana. All rights reserved.
//

#import "Utils.h"

@interface Utils ()

@end

@implementation Utils

+ (UIView *)getNavTitleView:(NSString *)navTitle {
    CGSize navTitleTextSize = [navTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17.0]}];
    CGFloat navTitleTextSizeWidth = navTitleTextSize.width;
    if (navTitleTextSizeWidth > 160.0) {
        navTitleTextSizeWidth = 160.0;
    }
    UIView *navTitleView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, navTitleTextSizeWidth + 50.0, 30.0)];
    UILabel *navTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 0.0, navTitleTextSizeWidth, 30.0)];
    
    navTitleLabel.text = navTitle;
    [navTitleLabel setTextColor:[UIColor blackColor]];
    [navTitleLabel setFont:[UIFont boldSystemFontOfSize:17.0]];
    [navTitleLabel setBackgroundColor:[UIColor clearColor]];
    
    [navTitleView addSubview:navTitleLabel];
    
    return  navTitleView;
}

+ (void)reloadDataTableCell:(UITableView *)tableView section:(NSInteger)section row:(NSInteger)row {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
    [tableView beginUpdates];
    [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    [tableView endUpdates];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
