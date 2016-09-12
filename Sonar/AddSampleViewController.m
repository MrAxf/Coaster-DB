//
//  AddSampleViewController.m
//  Sonar
//
//  Created by Aula1 on 11/01/16.
//  Copyright (c) 2016 Grupo 1. All rights reserved.
//

#import "AddSampleViewController.h"
#import "GestorDB.h"
#import "SetSampleViewController.h"
#import "ResultsViewController.h"

@interface AddSampleViewController ()

@property (nonatomic, strong) GestorDB* gestorBD;
@property (nonatomic, strong) NSMutableArray *data;
- (IBAction)save:(id)sender;

@property (weak, nonatomic) IBOutlet UISlider *sliderFrec1;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec1;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec8;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec8;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec10;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec10;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec11;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec11;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec13;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec13;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec17;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec17;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec20;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec20;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec21;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec21;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec22;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec22;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec24;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec24;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec25;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec25;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec31;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec31;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec42;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec42;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec43;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec43;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec46;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec46;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec47;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec47;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec55;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec55;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec56;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec56;
@property (weak, nonatomic) IBOutlet UISlider *sliderFrec60;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec60;

-(void) cargarDatosEdicion;

@end

@implementation AddSampleViewController

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
    [self.sliderFrec1 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec8 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec10 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec11 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec13 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec17 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec20 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec21 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec22 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec24 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec25 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec31 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec42 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec43 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec46 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec47 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec55 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec56 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderFrec60 addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];

    self.gestorBD = [[GestorDB alloc] initWithDatabaseFilename:@"sonar.sqlite"];
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

- (IBAction)sliderValueChanged:(UISlider *)sender {
    if(sender == self.sliderFrec1)self.labelFrec1.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec8)self.labelFrec8.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec10)self.labelFrec10.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec11)self.labelFrec11.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec13)self.labelFrec13.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec17)self.labelFrec17.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec20)self.labelFrec20.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec21)self.labelFrec21.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec22)self.labelFrec22.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec24)self.labelFrec24.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec25)self.labelFrec25.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec31)self.labelFrec31.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec42)self.labelFrec42.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec43)self.labelFrec43.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec46)self.labelFrec46.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec47)self.labelFrec47.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec55)self.labelFrec55.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec56)self.labelFrec56.text = [NSString stringWithFormat:@"%0.3f", sender.value];
    else if(sender == self.sliderFrec60)self.labelFrec60.text = [NSString stringWithFormat:@"%0.3f", sender.value];

}

- (void) cargarDatosEdicion{

    NSString* consulta = [NSString stringWithFormat:@"select * from sample where id=%d and id_sub=%d", self.idRegistroEdicion, self.idSubmarine];
    NSArray *resultado = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
    self.sliderFrec1.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq1"]] floatValue];
    self.sliderFrec8.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq8"]] floatValue];
    self.sliderFrec10.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq10"]] floatValue];
    self.sliderFrec11.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq11"]] floatValue];
    self.sliderFrec13.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq13"]] floatValue];
    self.sliderFrec17.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq17"]] floatValue];
    self.sliderFrec20.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq20"]] floatValue];
    self.sliderFrec21.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq21"]] floatValue];
    self.sliderFrec22.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq22"]] floatValue];
    self.sliderFrec24.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq24"]] floatValue];
    self.sliderFrec25.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq25"]] floatValue];
    self.sliderFrec31.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq31"]] floatValue];
    self.sliderFrec42.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq42"]] floatValue];
    self.sliderFrec43.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq43"]] floatValue];
    self.sliderFrec46.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq46"]] floatValue];
    self.sliderFrec47.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq47"]] floatValue];
    self.sliderFrec55.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq55"]] floatValue];
    self.sliderFrec56.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq56"]] floatValue];
    self.sliderFrec60.value = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq60"]] floatValue];
    self.labelFrec1.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec1.value];
    self.labelFrec8.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec8.value];
    self.labelFrec10.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec10.value];
    self.labelFrec11.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec11.value];
    self.labelFrec13.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec13.value];
    self.labelFrec17.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec17.value];
    self.labelFrec20.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec20.value];
    self.labelFrec21.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec21.value];
    self.labelFrec22.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec22.value];
    self.labelFrec24.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec24.value];
    self.labelFrec25.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec25.value];
    self.labelFrec31.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec31.value];
    self.labelFrec42.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec42.value];
    self.labelFrec43.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec43.value];
    self.labelFrec46.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec46.value];
    self.labelFrec47.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec47.value];
    self.labelFrec55.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec55.value];
    self.labelFrec56.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec56.value];
    self.labelFrec60.text = [NSString stringWithFormat:@"%0.3f", self.sliderFrec60.value];
}

- (IBAction)save:(id)sender {
    self.data = [[NSMutableArray alloc] init];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec1.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec8.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec10.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec11.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec13.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec17.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec20.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec21.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec22.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec24.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec25.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec31.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec42.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec43.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec46.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec47.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec55.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec56.value]];
    [self.data addObject:[NSNumber numberWithFloat:self.sliderFrec60.value]];
  #ifdef VERSION2
    NSString *consulta;
    NSString *isRock = @"Mine";

    if (self.sliderFrec11.value <=0.197) {
        if (self.sliderFrec1.value <= 0.0392) {
            if (self.sliderFrec21.value <= 0.6918) isRock = @"Rock";
            else{
                if (self.sliderFrec42.value <= 0.0839) isRock = @"Rock";
                else{
                    if (self.sliderFrec24.value <= 0.6173) isRock = @"Rock";
                }
            }
        }
    }else{
        if (self.sliderFrec17.value > 0.6613) {
            if (self.sliderFrec21.value <= 0.5665) isRock = @"Rock";
            else{
                if (self.sliderFrec24.value <= 0.6444) {
                    if (self.sliderFrec25.value > 0.3952) isRock = @"Rock";
                }
            }
        }
    }

    if (self.idRegistroEdicion == -1){
        consulta = [NSString stringWithFormat:@"insert into sample values (null, '%d', %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, '%@')", self.idSubmarine, self.sliderFrec1.value, self.sliderFrec8.value, self.sliderFrec10.value, self.sliderFrec11.value, self.sliderFrec13.value, self.sliderFrec17.value, self.sliderFrec20.value, self.sliderFrec21.value, self.sliderFrec22.value, self.sliderFrec24.value, self.sliderFrec25.value, self.sliderFrec31.value, self.sliderFrec42.value, self.sliderFrec43.value, self.sliderFrec46.value, self.sliderFrec47.value, self.sliderFrec55.value, self.sliderFrec56.value, self.sliderFrec60.value, isRock];
    }else{
        consulta = [NSString stringWithFormat:@"update sample set freq1='%0.3f', freq8='%0.3f', freq10='%0.3f', freq11='%0.3f', freq13='%0.3f', freq17='%0.3f', freq20='%0.3f', freq21='%0.3f', freq22='%0.3f', freq24='%0.3f', freq25='%0.3f', freq31='%0.3f', freq42='%0.3f', freq43='%0.3f', freq46='%0.3f', freq47='%0.3f', freq55='%0.3f', freq56='%0.3f', freq60='%0.3f', isRock='%@' where id=%d and id_sub='%d'", self.sliderFrec1.value, self.sliderFrec8.value, self.sliderFrec10.value, self.sliderFrec11.value, self.sliderFrec13.value, self.sliderFrec17.value, self.sliderFrec20.value, self.sliderFrec21.value, self.sliderFrec22.value, self.sliderFrec24.value, self.sliderFrec25.value, self.sliderFrec31.value, self.sliderFrec42.value, self.sliderFrec43.value, self.sliderFrec46.value, self.sliderFrec47.value, self.sliderFrec55.value, self.sliderFrec56.value, self.sliderFrec60.value, isRock, self.idRegistroEdicion, self.idSubmarine];
    }
    [self.gestorBD executeQuery:consulta];
    if (self.gestorBD.filasAfectadas !=0){
        NSLog(@"Consulta ejecutada con ÉXITO...%d filas", self.gestorBD.filasAfectadas);
        //SEGUE
        [self performSegueWithIdentifier:@"toResultSegue" sender:self];
    }
    else{
        NSLog(@"No se ha podido ejecutar la consulta...repásala...");
    }
  #elif  VERSION3
    NSString *consulta;
    NSString *url = [NSString stringWithFormat:@"http://192.168.118.210:8080/WekaWrapper/sonar;attr1=%0.3f;attr2=%0.3f;attr3=%0.3f;attr4=%0.3f;attr5=%0.3f;attr6=%0.3f;attr7=%0.3f;attr8=%0.3f;attr9=%0.3f;attr10=%0.3f;attr11=%0.3f;attr12=%0.3f;attr13=%0.3f", self.sliderFrec1.value, self.sliderFrec8.value, self.sliderFrec10.value, self.sliderFrec11.value, self.sliderFrec13.value, self.sliderFrec17.value, self.sliderFrec20.value, self.sliderFrec21.value, self.sliderFrec22.value, self.sliderFrec24.value, self.sliderFrec25.value, self.sliderFrec31.value, self.sliderFrec42.value, self.sliderFrec43.value, self.sliderFrec46.value, self.sliderFrec47.value, self.sliderFrec55.value, self.sliderFrec56.value, self.sliderFrec60.value];
    NSString *isRock=[self getDataFrom:url];
    NSLog(isRock);


    if (self.idRegistroEdicion == -1){

        consulta = [NSString stringWithFormat:@"insert into sample values (null, '%d', %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, %0.3f, '%@')", self.idSubmarine, self.sliderFrec1.value, self.sliderFrec8.value, self.sliderFrec10.value, self.sliderFrec11.value, self.sliderFrec13.value, self.sliderFrec17.value, self.sliderFrec20.value, self.sliderFrec21.value, self.sliderFrec22.value, self.sliderFrec24.value, self.sliderFrec25.value, self.sliderFrec31.value, self.sliderFrec42.value, self.sliderFrec43.value, self.sliderFrec46.value, self.sliderFrec47.value, self.sliderFrec55.value, self.sliderFrec56.value, self.sliderFrec60.value, isRock];
    }else{
        consulta = [NSString stringWithFormat:@"update sample set freq1='%0.3f', freq8='%0.3f', freq10='%0.3f', freq11='%0.3f', freq13='%0.3f', freq17='%0.3f', freq20='%0.3f', freq21='%0.3f', freq22='%0.3f', freq24='%0.3f', freq25='%0.3f', freq31='%0.3f', freq42='%0.3f', freq43='%0.3f', freq46='%0.3f', freq47='%0.3f', freq55='%0.3f', freq56='%0.3f', freq60='%0.3f', isRock='%@' where id=%d and id_sub='%d'", self.sliderFrec1.value, self.sliderFrec8.value, self.sliderFrec10.value, self.sliderFrec11.value, self.sliderFrec13.value, self.sliderFrec17.value, self.sliderFrec20.value, self.sliderFrec21.value, self.sliderFrec22.value, self.sliderFrec24.value, self.sliderFrec25.value, self.sliderFrec31.value, self.sliderFrec42.value, self.sliderFrec43.value, self.sliderFrec46.value, self.sliderFrec47.value, self.sliderFrec55.value, self.sliderFrec56.value, self.sliderFrec60.value, isRock, self.idRegistroEdicion, self.idSubmarine];
    }
    [self.gestorBD executeQuery:consulta];
    if (self.gestorBD.filasAfectadas !=0){
        NSLog(@"Consulta ejecutada con ÉXITO...%d filas", self.gestorBD.filasAfectadas);
        //SEGUE
        [self performSegueWithIdentifier:@"toResultSegue" sender:self];
    }
    else{
        NSLog(@"No se ha podido ejecutar la consulta...repásala...");
    }


  #else

    //SEGUE
    [self performSegueWithIdentifier:@"toSetSegue" sender:self];
  #endif
}

- (NSString *) getDataFrom:(NSString *)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];

    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];

    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return nil;
    }

    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toSetSegue"]){
        SetSampleViewController* destino = [segue destinationViewController];
        destino.delegate = self;
        destino.idRegistroEdicion = self.idRegistroEdicion;
        destino.idSubmarine = self.idSubmarine;
        destino.datos = self.data;
    }else if([segue.identifier isEqualToString:@"toResultSegue"]){
        ResultsViewController* destino = [segue destinationViewController];
        NSLog(@"alberto1");
        destino.delegate = self;
        NSLog(@"alberto2");
        destino.idSample = self.idRegistroEdicion;
        NSLog(@"alberto3");
        destino.idSubmarine = self.idSubmarine;
        NSLog(@"alberto4");
        destino.datos = self.data;
    }
}

-(void) editionDidFinished{
    [self.delegate editionDidFinished];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
