//
//  albumDesMGR.m
//  jPhoToV01
//
//  Created by Po-Ting Chiang on 2014-04-11.
//  Copyright (c) 2014 Po-Ting Chiang. All rights reserved.
//

#import "albumDesMGR.h"
#import "albumDesNSObject.h"
#import <sqlite3.h>
@interface albumDesMGR()
{
    NSString *dbPath;
    sqlite3 *db;
}
@end
@implementation albumDesMGR

-(id) init
{
    self = [super init];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    dbPath = [documentPath stringByAppendingPathComponent:@"AlbumDesNoD.sqlite"];
    //Check if file exist and copy if necessary
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:dbPath] == false)
    {
        //if not copy the file from the application bundle
        NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"AlbumDesNoD" ofType:@"sqlite"];
        [fileManager copyItemAtPath:bundlePath toPath:dbPath error:nil];
    }
    
    return self;
}

+ (albumDesMGR *) sharedInstance
{
    static albumDesMGR *_instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[albumDesMGR alloc]init];
    });
    return _instance;
}

- (NSString *) stringFromColumn:(int) column inStatement:(sqlite3_stmt * ) statement
{
    char *columnValue = (char *) sqlite3_column_text(statement, column);
    return columnValue != NULL ? @(columnValue) : nil;
}

- (void) addAlbum:(albumDesNSObject *)album
{
    //All database access with SQLite follow the same five-step process:
    //(1) Open the database
    const char *queryString = "Insert Into albumDes(name, year, month, location, Des) Values (?, ?, ?, ?, ?)";
    sqlite3_stmt *sqlStatement;
    
    const char *fileName = [dbPath UTF8String];
    if(sqlite3_open(fileName, &db) == SQLITE_OK)
    {
        //(2) Prepare a statement
        if (sqlite3_prepare_v2(db, queryString, -1, &sqlStatement, NULL) == SQLITE_OK)
        {
            //(3) Step the statement (could be query or insert/update/delete)
            sqlite3_bind_text(sqlStatement, 1, [album.Name UTF8String], -1, SQLITE_TRANSIENT);
            //1 stands for the first ? marks
            //-1 stands for "no limited"
            sqlite3_bind_int64(sqlStatement, 2, album.year);
            sqlite3_bind_int64(sqlStatement, 3, album.month);
            sqlite3_bind_text(sqlStatement, 4, [album.location UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sqlStatement, 5, [album.Des UTF8String], -1, SQLITE_TRANSIENT);
            
            while (sqlite3_step(sqlStatement) != SQLITE_DONE)            {
                //log error message
                
            }
            
        }
        else
        {
            NSLog(@"Error code:%d\nError Message:%s", sqlite3_errcode(db), sqlite3_errmsg(db));
        }
        //(4) Finalize the statement (Go back to step 2 if necessary)
        sqlite3_finalize(sqlStatement);
        
    }
    //(5) Close the database
    sqlite3_close(db);
}

- (void) updateAlbum:(albumDesNSObject *) album
{
    const char *queryString = "Update albumDes Set name = ?, year = ?, month = ?, location = ?, Des = ? Where id = ?";
    
    sqlite3_stmt *sqlStatement;
    
    const char *fileName = [dbPath UTF8String];
    if(sqlite3_open(fileName, &db) == SQLITE_OK)
    {
        //(2) Prepare a statement
        if (sqlite3_prepare_v2(db, queryString, -1, &sqlStatement, NULL) == SQLITE_OK)
        {
            //(3) Step the statement (could be query or insert/update/delete)
            sqlite3_bind_text(sqlStatement, 1, [album.Name UTF8String], -1, SQLITE_TRANSIENT);
            //1 stands for the first ? marks
            //-1 stands for "no limited"
            sqlite3_bind_int64(sqlStatement, 2, album.year);
            sqlite3_bind_int64(sqlStatement, 3, album.month);
            sqlite3_bind_text(sqlStatement, 4, [album.location UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sqlStatement, 5, [album.Des UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_int(sqlStatement, 6, album.ID);
            
            while (sqlite3_step(sqlStatement) != SQLITE_DONE)
            {
                //log error message
                
            }
            
        }
        else
        {
            NSLog(@"Error code:%d\nError Message:%s", sqlite3_errcode(db), sqlite3_errmsg(db));
        }
        //(4) Finalize the statement (Go back to step 2 if necessary)
        sqlite3_finalize(sqlStatement);
        
    }
    //(5) Close the database
    sqlite3_close(db);
    
}

- (void) deleteAlbum:(albumDesNSObject *)album
{
    const char *queryString = "Delete From albumDes Where id = ?";
    sqlite3_stmt *sqlStatement;
    
    const char *fileName = [dbPath UTF8String];
    if(sqlite3_open(fileName, &db) == SQLITE_OK)
    {
        
        if (sqlite3_prepare_v2(db, queryString, -1, &sqlStatement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_int(sqlStatement, 1, album.ID);
            while (sqlite3_step(sqlStatement) != SQLITE_DONE)
            {
                //log error message
                
            }
            
        }
        else
        {
            NSLog(@"Error code:%d\nError Message:%s", sqlite3_errcode(db), sqlite3_errmsg(db));
            
        }
        
        sqlite3_finalize(sqlStatement);
        
    }
    
    sqlite3_close(db);
}

- (NSArray *) albums
{
    const char *queryString = "SELECT ID, name, year, month, location, Des FROM albumDes ORDER BY year DESC, month DESC";
    NSMutableArray *albumArray = nil;
    sqlite3_stmt *sqlStatement;
    
    const char *fileName = [dbPath UTF8String];
    if(sqlite3_open(fileName, &db) == SQLITE_OK)
    {
        if (sqlite3_prepare_v2(db, queryString, -1, &sqlStatement, NULL) == SQLITE_OK)
        {
            albumArray = [[NSMutableArray alloc]init];
            while (sqlite3_step(sqlStatement)==  SQLITE_ROW)
            {
                albumDesNSObject *album = [[albumDesNSObject alloc]init];
                
                album.ID = sqlite3_column_int(sqlStatement, 0);
                album.year = sqlite3_column_int(sqlStatement, 2);
                album.month = sqlite3_column_int(sqlStatement, 3);
                
                album.Name = [self stringFromColumn:1 inStatement:sqlStatement];
                album.location = [self stringFromColumn:4 inStatement:sqlStatement];
                album.Des = [self stringFromColumn:5 inStatement:sqlStatement];
                
                [albumArray addObject:album];
            }
            
        }
        else
        {
            NSLog(@"Error code:%d\nError Message:%s", sqlite3_errcode(db), sqlite3_errmsg(db));
        }
        
        sqlite3_finalize(sqlStatement);
        
    }

    sqlite3_close(db);
    
    return albumArray;
}

@end
