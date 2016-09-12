//
//  SetSampleViewController.h
//  Sonar
//
//  Created by Aula1 on 25/01/16.
//  Copyright (c) 2016 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultsViewController.h"

@protocol SetSampleViewControllerDelegate

-(void) editionDidFinished;

@end

@interface SetSampleViewController : UIViewController <ResultsViewControllerDelegate>

@property (nonatomic) int idRegistroEdicion;
@property (nonatomic) int idSubmarine;
@property (nonatomic) NSMutableArray *datos;

@property (nonatomic, strong) id <SetSampleViewControllerDelegate> delegate;
- (IBAction)save:(id)sender;


@end
