//
//  AddSubmarineViewController.h
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddSubmarineViewControllerDelegate

-(void) editionDidFinished;

@end

@interface AddSubmarineViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *name;

@property (nonatomic) int idRegistroEdicion;

@property (nonatomic, strong) id <AddSubmarineViewControllerDelegate> delegate;
- (IBAction)save:(id)sender;

@end
