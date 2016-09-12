//
//  AddSampleViewController.h
//  Sonar
//
//  Created by Aula1 on 11/01/16.
//  Copyright (c) 2016 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultsViewController.h"
#import "SetSampleViewController.h"

@protocol AddSampleViewControllerDelegate

-(void) editionDidFinished;

@end

@interface AddSampleViewController : UIViewController <ResultsViewControllerDelegate, SetSampleViewControllerDelegate>

@property (nonatomic) int idSubmarine;
@property (nonatomic) int idRegistroEdicion;

@property (nonatomic, strong) id <AddSampleViewControllerDelegate> delegate;
- (IBAction)save:(id)sender;

@end
