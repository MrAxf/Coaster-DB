//
//  AddSubmarineViewController.m
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import "AddSubmarineViewController.h"
#import "GestorDB.h"

@interface AddSubmarineViewController ()
@property (nonatomic, strong) GestorDB* gestorBD;

-(void) cargarDatosEdicion;


@end

@implementation AddSubmarineViewController

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
    if (self.idRegistroEdicion != -1){
        [self cargarDatosEdicion];
    }
    
    [_name setDelegate:self];
    // Do any additional setup after loading the view.
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

- (void) cargarDatosEdicion{
    
    NSString* consulta = [NSString stringWithFormat:@"select * from submarine where id=%d", self.idRegistroEdicion];
    NSArray *resultado = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
    self.name.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"name"]];
}

- (IBAction)save:(id)sender {
    NSString *consulta;
    
    if (self.idRegistroEdicion == -1){
        consulta = [NSString stringWithFormat:@"insert into submarine values (null, '%@', null)", self.name.text];
    }else{
        consulta = [NSString stringWithFormat:@"update submarine set name='%@' where id=%d", self.name.text, self.idRegistroEdicion];
    }
    [self.gestorBD executeQuery:consulta];
    if (self.gestorBD.filasAfectadas !=0){
        NSLog(@"Consulta ejecutada con ÉXITO...%d filas", self.gestorBD.filasAfectadas);
        [self.delegate editionDidFinished];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"No se ha podido ejecutar la consulta...repásala...");
    }
}
@end
