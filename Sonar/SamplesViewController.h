//
//  SamplesViewController.h
//  Sonar
//
//  Created by Aula1 on 14/12/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultsViewController.h"
#import "AddSampleViewController.h"

@protocol SamplesViewControllerDelegate

-(void) editionDidFinished;

@end
@interface SamplesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ResultsViewControllerDelegate, AddSampleViewControllerDelegate>

@property (nonatomic) int idSubmarino;
@property (nonatomic) NSString* nombreSubmarino;

@property (nonatomic, strong) id <SamplesViewControllerDelegate> delegate;

@end
