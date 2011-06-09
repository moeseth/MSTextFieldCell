//
//  MSTextFieldCell.m
//
//  Created by Moe Seth on 6/9/11.
//  Copyright 2011 w00ty Lab. All rights reserved.

//  https://github.com/dev-moeseth


#import "MSTextFieldCell.h"

@implementation MSTextFieldCell

@synthesize usernameField, passwordField;
@synthesize usernameLabel, passwordLabel;
@synthesize selectedColor, normalColor;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        normalColor = [UIColor blackColor];
        selectedColor = [UIColor blueColor];
    }
    return self;
}

- (void) loadUsernameField
{
    usernameField = [[UITextField alloc] init];
    usernameField.delegate = self;
    usernameField.frame = CGRectMake(self.contentView.frame.size.width/2 - 80, self.contentView.frame.size.height/2 - 8, 200, 25);
    usernameField.textColor = normalColor;
    usernameField.returnKeyType = UIReturnKeyNext;
    usernameField.keyboardType = UIKeyboardTypeNamePhonePad;
    usernameField.textAlignment = UITextAlignmentCenter;
    usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
    usernameField.font = [UIFont boldSystemFontOfSize:18.0];
    
    usernameLabel = [[UILabel alloc] init];
    usernameLabel.font = [UIFont boldSystemFontOfSize:20.0];
    usernameLabel.textAlignment = UITextAlignmentRight;
    usernameLabel.frame = CGRectMake(15, 10 , 100, 30);
    usernameLabel.text = @"Nick : ";
    
    [self.contentView addSubview:usernameField];
    [self.contentView addSubview:usernameLabel];
}

- (void) loadPassField
{
    passwordField = [[UITextField alloc] init];
    passwordField.delegate = self;
    passwordField.frame = CGRectMake(self.contentView.frame.size.width/2 - 80, self.contentView.frame.size.height/2 - 8, 200, 25);
    passwordField.textColor = normalColor;
    passwordField.keyboardType = UIKeyboardTypeNumberPad;
    passwordField.textAlignment = UITextAlignmentCenter;
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordField.font = [UIFont boldSystemFontOfSize:18.0];
    
    passwordLabel = [[UILabel alloc] init];
    passwordLabel.font = [UIFont boldSystemFontOfSize:20.0];
    passwordLabel.textAlignment = UITextAlignmentRight;
    passwordLabel.frame = CGRectMake(15, 10 , 100, 30);
    passwordLabel.text = @"ID :";
    
    [self.contentView addSubview:passwordField];
    [self.contentView addSubview:passwordLabel];
}

- (void) setUsernameLabel:(UILabel *)username 
{
    if (username)
        usernameLabel.text = [username retain];
}

- (void) setPasswordLabel:(UILabel *)password
{
    if (password)
        passwordLabel.text = [password retain];
}

- (void) setSelectedColor:(UIColor *)selected
{
    if (selected) {
        selectedColor = [selected retain];
        usernameLabel.textColor = selectedColor;
        passwordLabel.textColor = selectedColor;
    }
}

- (void) setNormalColor:(UIColor *)normal
{
    if (normal) {
        normalColor = [normal retain];
        usernameLabel.textColor = normalColor;
        passwordLabel.textColor = normalColor;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    [passwordField becomeFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == usernameField) 
        usernameLabel.textColor = selectedColor;
    else
        passwordLabel.textColor = selectedColor;
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField == usernameField)
        usernameLabel.textColor = normalColor;
    else
        passwordLabel.textColor = normalColor;
    return YES;
}

- (void)dealloc
{
    [super dealloc];
    [usernameLabel release];
    [usernameField release];
    [passwordLabel release];
    [passwordField release];
    [selectedColor release];
    [normalColor release];
}

@end
