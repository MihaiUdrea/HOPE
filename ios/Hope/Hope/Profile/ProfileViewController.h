//
//  ProfileViewController.h
//  Hope
//
//  Created by Dana Buca on 20/10/2018.
//  Copyright © 2018 Dana Bucadana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

@property (nonatomic, retain) UITableView *profileTableView;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIImagePickerController *cameraUI;
@property (nonatomic, retain) UIActionSheet *actionSheetPhoto;
@property (nonatomic, retain) UIButton *photoButton;
@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *age;
@property (nonatomic, retain) UILabel *homeAddress;
@property (nonatomic, retain) UILabel *workAddress;
@property (nonatomic, retain) UITextField *nameTF;
@property (nonatomic, retain) UITextField *ageTF;
@property (nonatomic, retain) UITextField *homeAddressTF;
@property (nonatomic, retain) UITextField *workAddressTF;
//@property (nonatomic, retain) UISlider *slider;


@end
