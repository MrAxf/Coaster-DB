//
//  ResultsViewController.h
//  Sonar
//
//  Created by Aula1 on 25/01/16.
//  Copyright (c) 2016 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ResultsViewControllerDelegate

-(void) editionDidFinished;

@end

@interface ResultsViewController : UIViewController

@property (nonatomic) BOOL isRock;
@property (nonatomic) int idSample;
@property (nonatomic) int idSubmarine;
@property (nonatomic) NSMutableArray *datos;

@property (nonatomic, strong) id <ResultsViewControllerDelegate> delegate;

@end
