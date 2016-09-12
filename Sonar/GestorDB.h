//
//  GestorDB.h
//  Sesion04
//
//  Created by Aula1 on 26/10/15.
//  Copyright (c) 2015 Juan Andrés García Cañadas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GestorDB : NSObject

@property (nonatomic, strong) NSMutableArray *arrNombresCols;
@property (nonatomic) int filasAfectadas;
@property (nonatomic) long long ultimoID;

- (instancetype) initWithDatabaseFilename: (NSString *) dbFileName;
- (NSArray*) selectFromDB:(NSString*) consulta;
- (void) executeQuery: (NSString*) consulta;

@end
