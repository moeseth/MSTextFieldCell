//
//  MSTextFieldCell.h
//
//  Created by Moe Seth on 6/9/11.
//  Copyright 2011 w00ty Lab. All rights reserved.
//
//  https://github.com/dev-moeseth


#import <UIKit/UIKit.h>


@interface MSTextFieldCell : UITableViewCell <UITextFieldDelegate> 
{ 
    UITextField *usernameField, *passwordField;
    UILabel *usernameLabel, *passwordLabel;
    UIColor *selectedColor, *normalColor;
}

@property (nonatomic, retain) UITextField *usernameField, *passwordField;
@property (nonatomic, retain) UILabel *usernameLabel, *passwordLabel;
@property (nonatomic, retain) UIColor *selectedColor, *normalColor;

- (void) loadPassField;
- (void) loadUsernameField;

@end
