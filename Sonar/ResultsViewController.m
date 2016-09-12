//
//  ResultsViewController.m
//  Sonar
//
//  Created by Aula1 on 25/01/16.
//  Copyright (c) 2016 Grupo 1. All rights reserved.
//

#import "ResultsViewController.h"
#import "GestorDB.h"
#import "SamplesViewController.h"

@interface ResultsViewController ()
- (IBAction)back:(id)sender;

@property (nonatomic, strong) GestorDB* gestorBD;

@property (weak, nonatomic) IBOutlet UILabel *labelFrec1;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec8;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec10;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec11;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec13;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec17;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec20;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec21;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec22;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec24;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec25;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec31;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec42;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec43;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec46;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec47;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec55;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec56;
@property (weak, nonatomic) IBOutlet UILabel *labelFrec60;

@end

@implementation ResultsViewController

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
    [self cargarDatos];
    UIAlertView *alert;
    if(self.isRock){
        alert = [[UIAlertView alloc]
                 initWithTitle:@"Warning"
                 message:@"A rock was found"
                 delegate:self
                 cancelButtonTitle:@"Ok"
                 otherButtonTitles:nil];
        [alert show];
    }else{
        alert = [[UIAlertView alloc]
                 initWithTitle:@"Warning"
                 message:@"A mine was found"
                 delegate:self
                 cancelButtonTitle:@"Ok"
                 otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) cargarDatos{
    
    if(self.idSample != -1){
        NSString* consulta = [NSString stringWithFormat:@"select * from sample where id=%d and id_sub=%d", self.idSample, self.idSubmarine];
        NSArray *resultado = [[NSArray alloc] initWithArray:[self.gestorBD selectFromDB:consulta]];
        self.labelFrec1.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq1"]] floatValue]];
        self.labelFrec8.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq8"]] floatValue]];
        self.labelFrec10.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq10"]] floatValue]];
        self.labelFrec11.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq11"]] floatValue]];
        self.labelFrec13.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq13"]] floatValue]];
        self.labelFrec17.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq17"]] floatValue]];
        self.labelFrec20.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq20"]] floatValue]];
        self.labelFrec21.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq21"]] floatValue]];
        self.labelFrec22.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq22"]] floatValue]];
        self.labelFrec24.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq24"]] floatValue]];
        self.labelFrec25.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq25"]] floatValue]];
        self.labelFrec31.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq31"]] floatValue]];
        self.labelFrec42.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq42"]] floatValue]];
        self.labelFrec43.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq43"]] floatValue]];
        self.labelFrec46.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq46"]] floatValue]];
        self.labelFrec47.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq47"]] floatValue]];
        self.labelFrec55.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq55"]] floatValue]];
        self.labelFrec56.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq56"]] floatValue]];
        self.labelFrec60.text = [NSString stringWithFormat:@"%0.3f", [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"freq60"]] floatValue]];
        self.isRock = [[[resultado objectAtIndex:0] objectAtIndex:[self.gestorBD.arrNombresCols indexOfObject:@"isRock"]] isEqual:@"Rock"];
    }else{
        self.labelFrec1.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:0] floatValue]];
        self.labelFrec8.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:1] floatValue]];
        self.labelFrec10.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:2] floatValue]];
        self.labelFrec11.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:3] floatValue]];
        self.labelFrec13.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:4] floatValue]];
        self.labelFrec17.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:5] floatValue]];
        self.labelFrec20.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:6] floatValue]];
        self.labelFrec21.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:7] floatValue]];
        self.labelFrec22.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:8] floatValue]];
        self.labelFrec24.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:9] floatValue]];
        self.labelFrec25.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:10] floatValue]];
        self.labelFrec31.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:11] floatValue]];
        self.labelFrec42.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:12] floatValue]];
        self.labelFrec43.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:13] floatValue]];
        self.labelFrec46.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:14] floatValue]];
        self.labelFrec47.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:15] floatValue]];
        self.labelFrec55.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:16] floatValue]];
        self.labelFrec56.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:17] floatValue]];
        self.labelFrec60.text = [NSString stringWithFormat:@"%0.3f", [[self.datos objectAtIndex:18] floatValue]];
    }
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

- (IBAction)back:(id)sender {
    NSMutableArray *allViewControllers = [NSMutableArray arrayWithArray:[self.navigationController viewControllers]];
    for (UIViewController *aViewController in allViewControllers) {
        if ([aViewController isKindOfClass:[SamplesViewController class]]) {
            [self.navigationController popToViewController:aViewController animated:YES];
        }
    }
   
}

@end
