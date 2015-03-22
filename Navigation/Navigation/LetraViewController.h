//
//  LetraViewController.h
//  Navigation
//
//  Created by Patricia Machado de Abreu on 17/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dictionary.h"
#import "Pagina.h"

@interface LetraViewController : UIViewController

@property (nonatomic) int pagina;
@property RLMRealm *realm;
@property BOOL imagemTocada;

-(void)prepararPagina:(int) pagina;
@end
