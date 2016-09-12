//
//  AddSubmarineViewController.h
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoastersViewController.h"

@interface RegisterViewController : UIViewController <UITextFieldDelegate, CoastersViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *regnombre;
@property (weak, nonatomic) IBOutlet UITextField *regpassword;
@property (weak, nonatomic) IBOutlet UITextField *regpasswordR;
@property (weak, nonatomic) IBOutlet UITextField *lognombre;
@property (weak, nonatomic) IBOutlet UITextField *logpassword;


@end
