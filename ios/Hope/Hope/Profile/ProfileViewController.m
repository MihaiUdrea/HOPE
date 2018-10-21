//
//  ProfileViewController.m
//  Hope
//
//  Created by Dana Buca on 20/10/2018.
//  Copyright © 2018 Dana Bucadana. All rights reserved.
//

#import "ProfileViewController.h"
#import "Utils.h"
#import "Constants.h"
@import UIKit;
#import <MobileCoreServices/UTCoreTypes.h>

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize profileTableView, imageView, cameraUI, actionSheetPhoto, photoButton, name, age, homeAddress, workAddress, nameTF, ageTF, homeAddressTF, workAddressTF;
BOOL dismissImagePickerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.view setBackgroundColor:[UIColor yellowColor]];
    self.navigationItem.titleView = [Utils getNavTitleView:@"Hope"];
    [self setUpProfileTableView];
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50.0, 20.0, 100.0, 100.0)];
    imageView.backgroundColor = [UIColor grayColor];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 50.0;
    imageView.image = [UIImage imageNamed:@"noAccount.png"];
    [profileTableView addSubview:imageView];
    
    
    photoButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50.0, 20.0, 100.0, 100.0)];
    photoButton.layer.masksToBounds = YES;
    photoButton.layer.cornerRadius = 50.0;
    photoButton.backgroundColor = [UIColor clearColor];
    [photoButton addTarget:self action:@selector(photoAction:) forControlEvents:UIControlEventTouchDown];
    
    name = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 70, 20)];
    [name setText:@"Name"];
    
    nameTF = [[UITextField alloc] initWithFrame:CGRectMake(80, 0, 300, 50)];
    
    ageTF = [[UITextField alloc] initWithFrame:CGRectMake(80, 0, 300, 50)];
    age = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 70, 20)];
    [age setText:@"Age"];
    
    homeAddressTF = [[UITextField alloc] initWithFrame:CGRectMake(140, 0, 300, 50)];
    homeAddress = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 120, 20)];
    [homeAddress setText:@"Home Address"];
    
    workAddressTF = [[UITextField alloc] initWithFrame:CGRectMake(140, 0, 300, 50)];
    workAddress = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 120, 20)];
    [workAddress setText:@"Work Address"];
    
//    CGRect frame = CGRectMake(0.0, 20.0, 200.0, 10.0);
//    slider = [[UISlider alloc] initWithFrame:frame];
//    //[slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
//    [slider setBackgroundColor:[UIColor clearColor]];
//    slider.minimumValue = 0.0;
//    slider.maximumValue = 50.0;
//    slider.continuous = YES;
//    slider.value = 25.0;
    
    
    
    cameraUI = [[UIImagePickerController alloc]init];
    cameraUI.editing = YES;
    cameraUI.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) setUpProfileTableView {
    
    [profileTableView removeFromSuperview];
    profileTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, SCREEN_HEIGHT-50.0) style:UITableViewStylePlain];
    profileTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    profileTableView.backgroundColor = [UIColor whiteColor];
    profileTableView.delegate = self;
    profileTableView.dataSource = self;
    profileTableView.scrollEnabled = YES;
    profileTableView.allowsSelection = NO;
    profileTableView.userInteractionEnabled = YES;
    profileTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    profileTableView.userInteractionEnabled = YES;
    [self.view addSubview:profileTableView];
}

-(IBAction)photoAction:(id)sender {
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    [buttons addObject:NSLocalizedString(@"Add Photo", nil)];
    [buttons addObject:NSLocalizedString(@"Choose Photo", nil)];
    [buttons addObject:NSLocalizedString(@"Delete Photo", nil)];
    
    // action sheet
    actionSheetPhoto = [[UIActionSheet alloc]
                        initWithTitle:nil
                        delegate:self
                        cancelButtonTitle:NSLocalizedString(@"Cancel", nil)
                        destructiveButtonTitle:nil
                        otherButtonTitles:buttons[0], buttons[1],buttons[2], nil];
    
    actionSheetPhoto.actionSheetStyle = UIActionSheetStyleDefault;
   
    
    [actionSheetPhoto showFromRect:photoButton.frame inView:photoButton animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    [actionSheet dismissWithClickedButtonIndex:buttonIndex animated:YES];
    
    if (buttonIndex == 0) {
        cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
        cameraUI.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeImage, nil];
        [self performSelector:@selector(showCamera) withObject:nil afterDelay:0.3];
    } else if (buttonIndex == 1) {
        cameraUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        cameraUI.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeImage, nil];
        [self performSelector:@selector(showCamera) withObject:nil afterDelay:0.3];
    } else if (buttonIndex == 2) {
        imageView.image = [UIImage imageNamed:@"noAccount.png"];
        [Utils reloadDataTableCell:profileTableView section:0 row:0];
    }
    
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }  else {
        return 4;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 150.0;
    }
    return 50.0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [NSString stringWithFormat:@"Cell %d,%d", (int)indexPath.row, (int)indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    if (indexPath.section == 0 ) {
        [cell.contentView addSubview:imageView];
        [cell.contentView addSubview:photoButton];
    } else if (indexPath.section == 1){
        if (indexPath.row == 0){
            [cell.contentView addSubview:name];
            [cell.contentView addSubview:nameTF];
        } else if (indexPath.row == 1){
            [cell.contentView addSubview:age];
            [cell.contentView addSubview:ageTF];
        } else if (indexPath.row == 2) {
            [cell.contentView addSubview:homeAddress];
            [cell.contentView addSubview:homeAddressTF];
        } else if (indexPath.row == 3){
            [cell.contentView addSubview:workAddress];
            [cell.contentView addSubview:workAddressTF];
        }
//        } else if(indexPath.row == 4){
//            [cell.contentView addSubview:slider];
//        }
    }
    
    return cell;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *imageCaptured = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage]; //
    
    imageView.image = imageCaptured;
    
    dismissImagePickerView = YES;
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    dismissImagePickerView = YES;
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)showCamera {
    [self presentViewController:cameraUI animated:YES completion:NULL];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (dismissImagePickerView == YES) {
        dismissImagePickerView = NO;
        
        [Utils reloadDataTableCell:profileTableView section:0 row:0];
        
        return;
    }
    
    
    
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
