//
//  SamplesViewController.m
//  Sonar
//
//  Created by Aula1 on 14/12/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import "SamplesViewController.h"
#import "AddSampleViewController.h"
#import "GestorDB.h"
#import "ResultsViewController.h"

@interface SamplesViewController ()
- (IBAction)addSample:(id)sender;
@property (nonatomic, strong) GestorDB* gestorBD;
@property (nonatomic, strong) NSArray* arrayDatos;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (nonatomic) int idRegistroEditar;

@end

@implementation SamplesViewController

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
    self.navBar.title = self.nombreSubmarino;
    self.table.delegate = self;
    self.table.dataSource = self;
    self.gestorBD = [[GestorDB alloc] initWithDatabaseFilename:@"sonar.sqlite"];
    [self cargarDatos];
    // Do any additional setup after loading the view.
}

-(void) cargarDatos{
    NSString *consulta = [NSString stringWithFormat:@"select * from sample where id_sub=%d",self.idSubmarino];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    
    NSInteger indexOfNombre = [self.gestorBD.arrNombresCols indexOfObject:@"id"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Sample nº %@", [[self.arrayDatos objectAtIndex: indexPath.row] objectAtIndex:indexOfNombre]];
    return cell;
}

-(void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *)indexPath{
    self.idRegistroEditar = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:0]intValue];
    [self performSegueWithIdentifier:@"idSegueSample" sender:self];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int idRegistro;
    NSString *consulta;
    
    if (editingStyle != UITableViewCellEditingStyleDelete) return;
    idRegistro = [[[self.arrayDatos objectAtIndex:indexPath.row]
                   objectAtIndex:0]intValue]; consulta = [NSString stringWithFormat:@"delete from sample where id=%d",idRegistro];
    
    [self.gestorBD executeQuery:consulta];
    [self cargarDatos];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.idRegistroEditar = [[[self.arrayDatos objectAtIndex:indexPath.row] objectAtIndex:0]intValue];
    [self performSegueWithIdentifier:@"toResultFromSampleSegue" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"idSegueSample"]){
        AddSampleViewController* destino = [segue destinationViewController];
        destino.delegate = self;
        destino.idRegistroEdicion = self.idRegistroEditar;
        destino.idSubmarine = self.idSubmarino;
    }else if ([segue.identifier isEqualToString:@"toResultFromSampleSegue"]){
        ResultsViewController* destino = [segue destinationViewController];
        destino.delegate = self;
        destino.idSample = self.idRegistroEditar;
        destino.idSubmarine = self.idSubmarino;
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

- (IBAction)addSample:(id)sender {
    self.idRegistroEditar = -1;
    NSLog(@"lol");
    [self performSegueWithIdentifier:@"idSegueSample" sender:self];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self cargarDatos];
}
@end
