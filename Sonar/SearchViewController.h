//
//  AddSubmarineViewController.h
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchViewControllerDelegate

-(void) editionDidFinished;

@end

@interface SearchViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nombre;
@property (weak, nonatomic) IBOutlet UITextField *tipo;
@property (weak, nonatomic) IBOutlet UISwitch *favorito;

@property (nonatomic, strong) id <SearchViewControllerDelegate> delegate;
- (IBAction)save:(id)sender;

@end
