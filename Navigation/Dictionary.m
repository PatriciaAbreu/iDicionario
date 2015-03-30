
//
//  Dictionary.m
//  Navigation
//
//  Created by Patricia Machado de Abreu on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Dictionary.h"


@implementation Dictionary


#pragma mark - Persistencia de dados

//Este método deve ser chamado somente quando a aplicação inicia
-(void)iniciandoBancoDados{
    
    //consulta para verificar se os dados iniciais já estão no banco
    
    if ([self buscaObjetoBancoDadosWithPage:0] != nil) {
        return;
    }else{
        
        //Se não existe nada no banco, inicializa usando o código a seguir, caso contrário retorna sem fazer nada
        NSMutableArray *letter = [[NSMutableArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil ];
        
        NSMutableArray *image = [[NSMutableArray alloc] initWithObjects:@"alice", @"ben10", @"cebolinha", @"dumbo", @"elza", @"fiona", @"galinhaPintadinha", @"huguinho", @"iara", @"jerry", @"kiara", @"luizinho", @"mickeyMouse", @"nemo", @"olaf", @"pocahontas", @"quinzinho", @"reiLeao", @"sininho", @"tom", @"ursinhoPooh", @"viscondeSabugosa", @"wood", @"xaveco", @"yasmin", @"zezinho", nil];
        
        NSMutableArray *text =[[NSMutableArray alloc] initWithObjects:@"Alice", @"Ben 10", @"Cebolinha", @"Dumbo", @"Elza", @"Fiona", @"Galinha Pintadinha", @"Huguinho", @"Iara", @"Jerry", @"Kiara", @"Luizinho", @"Mickey Mouse", @"Nemo", @"Olaf", @"Pocahontas", @"Quinzinho", @"Rei Leão", @"Sininho", @"Tom", @"Ursinho Pooh", @"Visconde de Sabugosa", @"Wood", @"Xaveco", @"Yasmin", @"Zezinho", nil];
        
        
        //    inicializando conexao com o banco de dados
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        
        for (int i = 0; i < letter.count; i++) {
            //    instanciar objetos (fazer FOR)
            Pagina *objeto = [[Pagina alloc] init];
            objeto.letter = [letter objectAtIndex:i];
            objeto.text = [text objectAtIndex:i];
            objeto.image = [image objectAtIndex:i];
            objeto.number = i;
            
            
            //    inicia a transação do banco de dados
            [realm beginWriteTransaction];
            
            //    persistencia de dados
            [realm addObject:objeto];
            
            //    termina transicao
            [realm commitWriteTransaction];
        }
    }
}

-(Pagina *)buscaObjetoBancoDadosWithPage:(int)page
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"number == %i",page];
    RLMResults *results = [Pagina objectsWithPredicate:pred];
    
    if (results.count==0)
        return nil;
    
    Pagina *resultado = [[Pagina alloc] init];
    resultado = (Pagina *)[results lastObject];
    return resultado;
}


-(void)alteraObjetoBancoDadosWithPage:(int)page andWithText:(NSString *)text {
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"number == %i",page];
    RLMResults *results = [Pagina objectsWithPredicate:pred];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    
    Pagina *update = [[Pagina alloc] init];
    
    update.letter = [results.firstObject letter];
    update.image = (NSString *)[results.firstObject image];
    update.text = text;
    
    [realm commitWriteTransaction];
    
}

-(NSString *)getLetterDataBasesWithPage:(int)page{
 
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"number == %i",page];
    RLMResults *results = [Pagina objectsWithPredicate:pred];
    
    Pagina *pagina = [[Pagina alloc]init];
    
    pagina = results.firstObject;
    
    return pagina.letter;
}

-(NSString *)getTextDataBasesWithPage:(int)page{
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"number == %i",page];
    RLMResults *results = [Pagina objectsWithPredicate:pred];

    Pagina *pagina = [[Pagina alloc]init];
    
    pagina = results.firstObject;
    
    return pagina.text;
}

-(NSString *)getImageDataBasesWithPage:(int)page{
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"number == %i",page];
    RLMResults *results = [Pagina objectsWithPredicate:pred];
    
    Pagina *pagina = [[Pagina alloc]init];
    
    pagina = results.firstObject;
    
    return pagina.image;
}
@end
