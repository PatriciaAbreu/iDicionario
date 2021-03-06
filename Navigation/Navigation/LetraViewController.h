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
#import <AVFoundation/AVFoundation.h>


@interface LetraViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic) int pagina;
@property BOOL imagemTocada;

-(void)prepararPagina:(int) pagina;
@end
