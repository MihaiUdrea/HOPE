//
//  Utils.h
//  Hope
//
//  Created by Dana Buca on 20/10/2018.
//  Copyright © 2018 Dana Bucadana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Utils : UIViewController
+ (UIView *)getNavTitleView:(NSString *)navTitle;
+ (void)reloadDataTableCell:(UITableView *)tableView section:(NSInteger)section row:(NSInteger)row;

@end
