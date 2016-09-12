//
//  AddSubmarineViewController.m
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import "RegisterViewController.h"
#import "CoastersViewController.h"
#import "GestorDB.h"

@interface RegisterViewController ()
@property (nonatomic, strong) GestorDB* gestorBD;
- (IBAction)register:(id)sender;
- (IBAction)login:(id)sender;

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.gestorBD = [[GestorDB alloc] initWithDatabaseFilename:@"coasters.sqlite"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)register:(id)sender{
  if([self.regnombre.text length] == 0 || [self.regpassword.text length] == 0 || [self.regpasswordR.text length] == 0){
    UIAlertView *alert;
    alert = [[UIAlertView alloc]
    initWithTitle:@"Warning"
    message:@"Empty fields in register"
    delegate:self
    cancelButtonTitle:@"Ok"
    otherButtonTitles:nil];
    [alert show];
  }else if(![self.regpassword.text isEqualToString:self.regpasswordR.text]){
    UIAlertView *alert;
    alert = [[UIAlertView alloc]
    initWithTitle:@"Warning"
    message:@"Passwords are not equals"
    delegate:self
    cancelButtonTitle:@"Ok"
    otherButtonTitles:nil];
    [alert show];
  }else{
    NSString* consulta = [NSString stringWithFormat:@"INSERT INTO user (nombre, clave) VALUES('%@', '%@')", self.regnombre.text, self.regpassword.text];
    [self.gestorBD executeQuery:consulta];
    UIAlertView *alert;
    alert = [[UIAlertView alloc]
    initWithTitle:@"Warning"
    message:@"Sign in successfull"
    delegate:self
    cancelButtonTitle:@"Ok"
    otherButtonTitles:nil];
    [alert show];
  }
}
- (IBAction)login:(id)sender{
    NSString* consulta = [NSString stringWithFormat:@"SELECT * FROM user WHERE nombre= '%@' AND clave= '%@'", self.lognombre.text, self.logpassword.text];
    NSArray *dbquery = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
    if ([dbquery count] > 0){
      [self performSegueWithIdentifier:@"idSegueCoasters" sender:self];
    }else{
      [self.gestorBD executeQuery:consulta];
      UIAlertView *alert;
      alert = [[UIAlertView alloc]
      initWithTitle:@"Warning"
      message:@"Log in fail"
      delegate:self
      cancelButtonTitle:@"Ok"
      otherButtonTitles:nil];
      [alert show];
    }
  }


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"idSegueCoasters"]){
        CoastersViewController* destino = [segue destinationViewController];
        destino.delegate = self;
    }
}
@end
