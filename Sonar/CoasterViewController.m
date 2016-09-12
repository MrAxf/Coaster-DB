//
//  ResultsViewController.m
//  Sonar
//
//  Created by Aula1 on 25/01/16.
//  Copyright (c) 2016 Grupo 1. All rights reserved.
//

#import "CoasterViewController.h"
#import "GestorDB.h"
#import "CoastersViewController.h"

@interface CoasterViewController ()
- (IBAction)fav:(id)sender;

@property (nonatomic, strong) GestorDB* gestorBD;

@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UILabel *altura;
@property (weak, nonatomic) IBOutlet UILabel *drops;
@property (weak, nonatomic) IBOutlet UILabel *loops;
@property (weak, nonatomic) IBOutlet UILabel *velocidad;
@property (weak, nonatomic) IBOutlet UILabel *tipo;
@property (weak, nonatomic) IBOutlet UILabel *lateralg;
@property (weak, nonatomic) IBOutlet UILabel *maxverticalg;
@property (weak, nonatomic) IBOutlet UILabel *minverticalg;
@property (weak, nonatomic) IBOutlet UILabel *intensidad;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIButton *favButton;
@property NSMutableData *responseData;
@property int favorito;


@end

@implementation CoasterViewController

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
    [self cargarDatos];

    if(self.favorito == 0){
      [self.favButton setBackgroundImage:[UIImage imageNamed:@"nofav.png"] forState:UIControlStateNormal];
    }else{
      [self.favButton setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
    }
    #ifdef VERSION2
    #else
      [self.favButton removeFromSuperview];
    #endif
    
    NSString *nameFormat = [self.nombre.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *url = [NSString stringWithFormat:@"http://celeminasistencias.alboradait.com/controller/photo?q=%@", nameFormat];
    self.mainImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) cargarDatos{

      NSString* consulta = [NSString stringWithFormat:@"select * from coaster where id=%d", self.idCoasterSelected];
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
      self.intensidad.text = [[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"intensidad"]];
      self.favorito = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"favorita"]] integerValue];

    #ifdef VERSION2
    #else
      self.intensidad.text=@"Only in premiun";
    #endif
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
- (IBAction)fav:(id)sender{

  NSString *consulta;
  if(self.favorito == 0){
    consulta = [NSString stringWithFormat:@"UPDATE coaster SET favorita=1 WHERE id = %d", self.idCoasterSelected];
    [self.favButton setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
  }else{
    consulta = [NSString stringWithFormat:@"UPDATE coaster SET favorita=0 WHERE id = %d", self.idCoasterSelected];
    [self.favButton setBackgroundImage:[UIImage imageNamed:@"nofav.png"] forState:UIControlStateNormal];
  }
  [self.gestorBD executeQuery:consulta];
}

@end
