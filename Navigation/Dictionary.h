//
//  Dictionary.h
//  Navigation
//
//  Created by Patricia Machado de Abreu on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "Pagina.h"

@interface Dictionary : NSObject
//@property NSMutableArray *letter;
//@property NSMutableArray *image;
//@property NSMutableArray *text;
//@property RLMRealm *realm;

//-(void) initPage;
//-(NSString *) getLetterWithPage:(int)page;
//-(NSString *) getImageWithPage:(int)page;
//-(NSString *) getTextWihPage:(int)page;
//-(int) getNumberOfLetters;
//-(void)setText:(NSString *)text withPage:(int)page;

-(void)iniciandoBancoDados;
-(Pagina *)buscaObjetoBancoDadosWithPage:(int)page;
-(void)alteraObjetoBancoDadosWithPage:(int)page andWithText:(NSString *)text;
-(NSString *)getLetterDataBasesWithPage:(int)page;
-(NSString *)getTextDataBasesWithPage:(int)page;
-(NSString *)getImageDataBasesWithPage:(int)page;

@end
