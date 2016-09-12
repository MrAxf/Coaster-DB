//
//  SubmarineViewController.m
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import "SubmarineViewController.h"
#import "GestorDB.h"
#import "UALTableViewCellPersonalize.h"

@interface SubmarineViewController ()

@property (nonatomic, strong) GestorDB* gestorBD;
@property (nonatomic, strong) NSArray* arrayDatos;
@property (nonatomic) int idRegistroEditar;
@property (nonatomic) int idSubmarinoSelected;
@property (nonatomic) NSString* nombreSubmarinoSelected;
- (IBAction)addsubmarine:(id)sender;

@end

@implementation SubmarineViewController

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
    self.table.delegate = self;
    self.table.dataSource = self;
    self.gestorBD = [[GestorDB alloc] initWithDatabaseFilename:@"sonar.sqlite"];
    [self cargarDatos];
}

-(void) cargarDatos{
    NSString *consulta = @"select * from submarine";
    
    if (self.arrayDatos != nil) self.arrayDatos = nil;
    self.arrayDatos = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
    
    //actualizamos la tabla
    [self.table reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayDatos.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSInteger indexOfNombre = [self.gestorBD.arrNombresCols indexOfObject:@"name"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:indexOfNombre]];
    return cell;*/
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
    
    
    /*UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];*/
    
    UALTableViewCellPersonalize *cell = (UALTableViewCellPersonalize *)[tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    
    if (cell == nil)
	{
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UALTableViewCellPersonalize" owner:self options:nil];
		cell = (UALTableViewCellPersonalize *)[nib objectAtIndex:0];
	}
    
    NSInteger indexOfNombre = [self.gestorBD.arrNombresCols indexOfObject:@"name"];
    
    //Añadimos los datos a cada uno de los elementos de nuestra celda
    
    cell.titulo.text = [NSString stringWithFormat:@"%@", [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:indexOfNombre]];
    cell.imagen.image = [UIImage imageNamed:@"submarino.png"];
    
    return cell;

}

-(void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *)indexPath{
    self.idRegistroEditar = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:0]intValue];
    [self performSegueWithIdentifier:@"idSegueDetalle" sender:self];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int idRegistro;
    NSString *consulta;
    
    if (editingStyle != UITableViewCellEditingStyleDelete) return;
    idRegistro = [[[self.arrayDatos objectAtIndex:indexPath.row]
                   objectAtIndex:0]intValue]; consulta = [NSString stringWithFormat:@"delete from submarine where id=%d",idRegistro];
    
    [self.gestorBD executeQuery:consulta];
    [self cargarDatos];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.idSubmarinoSelected = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:0]intValue];
    self.nombreSubmarinoSelected = [NSString stringWithFormat:@"%@", [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:1]];
    [self performSegueWithIdentifier:@"idSegueSubmarino" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"idSegueDetalle"]){
        AddSubmarineViewController* destino = [segue destinationViewController];
        destino.delegate = self;
        destino.idRegistroEdicion = self.idRegistroEditar;
    }else if ([segue.identifier isEqualToString:@"idSegueSubmarino"]){
        SamplesViewController* destino = [segue destinationViewController];
        destino.delegate = self;
        destino.idSubmarino = self.idSubmarinoSelected;
        destino.nombreSubmarino = self.nombreSubmarinoSelected;
    }
}

-(void) editionDidFinished{
    [self cargarDatos];
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

- (IBAction)addsubmarine:(id)sender {
    self.idRegistroEditar = -1;
    NSLog(@"lol");
    [self performSegueWithIdentifier:@"idSegueDetalle" sender:self];
}
@end
