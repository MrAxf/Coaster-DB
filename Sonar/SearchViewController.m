//
//  AddSubmarineViewController.m
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import "SearchViewController.h"
#import "GestorDB.h"

@interface SearchViewController ()
@property (nonatomic, strong) GestorDB* gestorBD;

-(void) cargarDatosEdicion;


@end

@implementation SearchViewController

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
    [self cargarDatosEdicion];

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

    NSArray *resultado;
    resultado = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:@"SELECT * from search WHERE id=1"]];
    int fav;
    self.nombre.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"nombre"]];
    self.tipo.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"tipo"]];
    fav = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"favorito"]] integerValue];
    if (fav == 0){
      [self.favorito setOn:NO animated:NO];
    }else{
      [self.favorito setOn:YES animated:NO];
    }
}

- (IBAction)save:(id)sender {
    NSString *consulta;

    int favorito = 0;

    if ([self.favorito isOn]) {
      favorito = 1;
    }

    consulta = [NSString stringWithFormat:@"UPDATE search SET nombre='%@', tipo='%@', favorito=%d WHERE id = 1", self.nombre.text, self.tipo.text, favorito];
    NSLog(@"%@", consulta);

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
