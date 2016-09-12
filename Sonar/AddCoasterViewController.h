//
//  AddSubmarineViewController.h
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddCoasterViewControllerDelegate

-(void) editionDidFinished;

@end

@interface AddCoasterViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nombre;
@property (weak, nonatomic) IBOutlet UITextField *tipo;
@property (weak, nonatomic) IBOutlet UITextField *altura;
@property (weak, nonatomic) IBOutlet UITextField *velocidad;
@property (weak, nonatomic) IBOutlet UITextField *loops;
@property (weak, nonatomic) IBOutlet UITextField *drops;
@property (weak, nonatomic) IBOutlet UITextField *lateralg;
@property (weak, nonatomic) IBOutlet UITextField *maxverticalg;
@property (weak, nonatomic) IBOutlet UITextField *minverticalg;

@property (nonatomic) int idRegistroEdicion;

@property (nonatomic, strong) id <AddCoasterViewControllerDelegate> delegate;
- (IBAction)save:(id)sender;

@end
