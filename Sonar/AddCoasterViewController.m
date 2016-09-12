//
//  AddSubmarineViewController.m
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import "AddCoasterViewController.h"
#import "GestorDB.h"

@interface AddCoasterViewController ()
@property (nonatomic, strong) GestorDB* gestorBD;

-(void) cargarDatosEdicion;


@end

@implementation AddCoasterViewController

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
    NSLog(@"%d", self.idRegistroEdicion);
    if (self.idRegistroEdicion != -1){
        [self cargarDatosEdicion];
    }

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

    NSString* consulta = [NSString stringWithFormat:@"select * from coaster where id=%d", self.idRegistroEdicion];
    NSArray *resultado = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
    self.nombre.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"nombre"]];
    self.tipo.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"tipo"]];
    self.altura.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"altura"]];
    self.velocidad.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"velocidad"]];
    self.drops.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"drops"]];
    self.loops.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"loops"]];
    self.lateralg.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"lateralg"]];
    self.minverticalg.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"minverticalg"]];
    self.maxverticalg.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"maxverticalg"]];
}

- (IBAction)save:(id)sender {
    NSString *consulta;
    NSString *intensity;
    double intensidad = [self.altura.text doubleValue] + [self.lateralg.text doubleValue] + [self.velocidad.text doubleValue] + [self.drops.text doubleValue] + [self.loops.text doubleValue] + [self.maxverticalg.text doubleValue] + [self.minverticalg.text doubleValue];
    if (intensidad <= 100) {
      intensity = @"Low";
    }else if(intensidad > 100){
      intensity = @"Medium";
    }else if(intensidad > 200){
      intensity = @"Hight";
    }else if(intensidad > 300){
      intensity = @"Crazy";
    }

    if (self.idRegistroEdicion == -1){
        consulta = [NSString stringWithFormat:@"INSERT INTO coaster(nombre, tipo, altura, velocidad, drops, loops, lateralg, minverticalg, maxverticalg, favorita, intensidad) VALUES('%@', '%@', '%@', '%@', '%@', '%@',  '%@', '%@', '%@', '0', '%@' )", self.nombre.text, self.tipo.text, self.altura.text, self.velocidad.text, self.drops.text, self.loops.text, self.lateralg.text, self.minverticalg.text, self.maxverticalg.text, intensity];
    }else{
        consulta = [NSString stringWithFormat:@"UPDATE coaster SET nombre='%@', tipo='%@', altura='%@', velocidad='%@', drops='%@', loops='%@', lateralg='%@', minverticalg='%@', maxverticalg='%@', intensidad='%@' WHERE id = %d", self.nombre.text, self.tipo.text, self.altura.text, self.velocidad.text, self.drops.text, self.loops.text, self.lateralg.text, self.minverticalg.text, self.maxverticalg.text, intensity, self.idRegistroEdicion];
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
