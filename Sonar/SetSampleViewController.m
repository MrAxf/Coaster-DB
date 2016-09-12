//
//  SetSampleViewController.m
//  Sonar
//
//  Created by Aula1 on 25/01/16.
//  Copyright (c) 2016 Grupo 1. All rights reserved.
//

#import "SetSampleViewController.h"
#import "GestorDB.h"
#import "ResultsViewController.h"

@interface SetSampleViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *selector;
@property (nonatomic, strong) GestorDB* gestorBD;

@end

@implementation SetSampleViewController

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
    self.gestorBD = [[GestorDB alloc] initWithDatabaseFilename:@"sonar.sqlite"];
    NSLog(@"%d", self.idRegistroEdicion);
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

- (IBAction)save:(id)sender {
    NSString *isRock = (self.selector.selectedSegmentIndex == 0)?@"Mine":@"Rock";
    NSString *consulta;
    if (self.idRegistroEdicion == -1){
        consulta = [NSString stringWithFormat:@"insert into sample values (null, '%d', %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, '%@')",self.idSubmarine, [[self.datos objectAtIndex:0] floatValue], [[self.datos objectAtIndex:1] floatValue], [[self.datos objectAtIndex:2] floatValue], [[self.datos objectAtIndex:3] floatValue], [[self.datos objectAtIndex:4] floatValue], [[self.datos objectAtIndex:5] floatValue], [[self.datos objectAtIndex:6] floatValue], [[self.datos objectAtIndex:7] floatValue], [[self.datos objectAtIndex:8] floatValue], [[self.datos objectAtIndex:9] floatValue], [[self.datos objectAtIndex:10] floatValue], [[self.datos objectAtIndex:11] floatValue], [[self.datos objectAtIndex:12] floatValue], [[self.datos objectAtIndex:13] floatValue], [[self.datos objectAtIndex:14] floatValue], [[self.datos objectAtIndex:15] floatValue], [[self.datos objectAtIndex:16] floatValue], [[self.datos objectAtIndex:17] floatValue], [[self.datos objectAtIndex:18] floatValue], isRock];
    }else{
        consulta = [NSString stringWithFormat:@"update sample set freq1='%0.3f', freq8='%0.3f', freq10='%0.3f', freq11='%0.3f', freq13='%0.3f', freq17='%0.3f', freq20='%0.3f', freq21='%0.3f', freq22='%0.3f', freq24='%0.3f', freq25='%0.3f', freq31='%0.3f', freq42='%0.3f', freq43='%0.3f', freq46='%0.3f', freq47='%0.3f', freq55='%0.3f', freq56='%0.3f', freq60='%0.3f', isRock='%@' where id=%d and id_sub='%d'", [[self.datos objectAtIndex:0] floatValue], [[self.datos objectAtIndex:1] floatValue], [[self.datos objectAtIndex:2] floatValue], [[self.datos objectAtIndex:3] floatValue], [[self.datos objectAtIndex:4] floatValue], [[self.datos objectAtIndex:5] floatValue], [[self.datos objectAtIndex:6] floatValue], [[self.datos objectAtIndex:7] floatValue], [[self.datos objectAtIndex:8] floatValue], [[self.datos objectAtIndex:9] floatValue], [[self.datos objectAtIndex:10] floatValue], [[self.datos objectAtIndex:11] floatValue], [[self.datos objectAtIndex:12] floatValue], [[self.datos objectAtIndex:13] floatValue], [[self.datos objectAtIndex:14] floatValue], [[self.datos objectAtIndex:15] floatValue], [[self.datos objectAtIndex:16] floatValue], [[self.datos objectAtIndex:17] floatValue], [[self.datos objectAtIndex:18] floatValue], isRock, self.idRegistroEdicion, self.idSubmarine];
    }
    [self.gestorBD executeQuery:consulta];
    if (self.gestorBD.filasAfectadas !=0){
        NSLog(@"Consulta ejecutada con ÉXITO...%d filas", self.gestorBD.filasAfectadas);
        //SEGUE
        [self performSegueWithIdentifier:@"toResultFromSetSegue" sender:self];
    }
    else{
        NSLog(@"No se ha podido ejecutar la consulta...repásala...");
    }
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toResultFromSetSegue"]){
        ResultsViewController* destino = [segue destinationViewController];
        destino.delegate = self;
        destino.idSample = self.idRegistroEdicion;
        destino.idSubmarine = self.idSubmarine;
        destino.datos = self.datos;
        destino.isRock = (self.selector.selectedSegmentIndex == 0)?FALSE:TRUE;
    }
}

-(void) editionDidFinished{
    [self.delegate editionDidFinished];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
