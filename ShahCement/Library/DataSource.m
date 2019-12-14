//
//  DataSource.m
//  ShahCement
//
//  Created by Huq Majharul on 2018/02/14.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

+ (NSArray *)menu
{
    return @[
             
             @{
                 @"title": @"ভিডিও"
                 },
             @{
                 @"title": @"যোগাযোগ"
                 }
             ];
}

+ (NSArray *)productList
{
    return @[
             
             @{
                 @"name": @"01-design.png",
                 @"video_id": @"a3VMQdVvgdw"
                 },
             @{
                 @"name": @"02-soil_test.png",
                 @"video_id": @"ZkWP-J5uh48"
                 },
             @{
                 @"name": @"03-site_preperation.png",
                 @"video_id": @"QjcEaOjwF8Q"
                 },
             @{
                 @"name": @"04-piling.png",
                 @"video_id": @"kh_odUoKUqE"
                 },
             @{
                 @"name": @"05-foundation.png",
                 @"video_id": @"KpPlRdAzG7k"
                 },
             @{
                 @"name": @"06-formwork.png",
                 @"video_id": @"kt5YJXOtXgc"
                 },
             @{
                 @"name": @"07-rod_badhai.png",
                 @"video_id": @"MRtRsZNaBmU"
                 },
             @{
                 @"name": @"08-gathuni.png",
                 @"video_id": @"_SSdrWL8XTg"
                 },
             @{
                 @"name": @"09-concrete_dhalai.png",
                 @"video_id": @"sEBzAcnWncE"
                 },
             @{
                 @"name": @"10-plaster.png",
                 @"video_id": @"HDcU-FHcZ3E"
                 },
             @{
                 @"name": @"11-curing.png",
                 @"video_id": @"B7CZ0T17Ti8"
                 },
             @{
                 @"name": @"12-iter_kotha.png",
                 @"video_id": @"hZPfaFIIcx8"
                 },
             @{
                 @"name": @"13-bali.png",
                 @"video_id": @"i0U4G5X860Y"
                 },
             @{
                 @"name": @"14-khoa.png",
                 @"video_id": @"kkfpkAKYwF0"
                 },
             @{
                 @"name": @"15-stone.png",
                 @"video_id": @"baiVDBJ2pYM"
                 },
             @{
                 @"name": @"16-water.png",
                 @"video_id": @"hUFhpIgGq3E"
                 },
             @{
                 @"name": @"17-cement.png",
                 @"video_id": @"8Kqvxkgq-M0"
                 },
             @{
                 @"name": @"18-rod.png",
                 @"video_id": @"mVcALz_JWTs"
                 },
             @{
                 @"name": @"19-concrete.png",
                 @"video_id": @"9bNpcIsgm8I"
                 },
             @{
                 @"name": @"20-readymix_concrete.png",
                 @"video_id": @""
                 },
             @{
                 @"name": @"21-wood.png",
                 @"video_id": @"reUPZAlTPGc"
                 },
             @{
                 @"name": @"22-tiles.png",
                 @"video_id": @"lN62_bDVaTM"
                 },
             @{
                 @"name": @"23-marble.png",
                 @"video_id": @"eQxkzvZ3h_Y"
                 },
             @{
                 @"name": @"24-painting.png",
                 @"video_id": @"kyKnnr9W6Xo"
                 },
             @{
                 @"name": @"25-glass_alumunium.png",
                 @"video_id": @"rV1ElQHzsuA"
                 },
             @{
                 @"name": @"26-sanitary.png",
                 @"video_id": @"3m8GbDBkelo"
                 },
             @{
                 @"name": @"27-electric.png",
                 @"video_id": @"7DeQQCN66V8"
                 },
             @{
                 @"name": @"28-fire.png",
                 @"video_id": @"2-n_y2RmqjI"
                 },
             @{
                 @"name": @"29-earthquack.png",
                 @"video_id": @"AGo2TvtxtJo"
                 },
             ];
}

/*
+ (NSArray *)videoList
{
    return @[
             @{
                 @"image": @"01.png",
                 @"title" : @"Shahcement Houseful Offer TVC January - 2018",
                 @"duration" : @"0:51",
                 @"video_id" : @"NXg-l9vfCVU"
                 },
             @{
                 @"image": @"02.png",
                 @"title" : @"Shahcement Houseful Offer 2018",
                 @"duration" : @"0:31",
                 @"video_id" : @"v8Mrwvq6xpw"
                 },
             @{
                 @"image": @"03.png",
                 @"title" : @"Shah Cement - Proud Construction Partner of Padma Bridge.",
                 @"duration" : @"1:01",
                 @"video_id" : @"LIiNSrxLETk"
                 },
             @{
                 @"image": @"04.png",
                 @"title" : @"Sumon Shah Cement Nirmaner Taroka 2010 Performances",
                 @"duration" : @"2:48",
                 @"video_id" : @"Z3O9I9MlrKU"
                 },
             @{
                 @"image": @"05.png",
                 @"title" : @"Sumon Shah Cement Nirmaner Taroka 2010 Performances",
                 @"duration" : @"4:47",
                 @"video_id" : @"76D-URivq4Y"
                 },
             @{
                 @"image": @"06.png",
                 @"title" : @"onoshpoti Mojumder Shah Cement Nirmaner Taroka 2010 Performances",
                 @"duration" : @"6:15",
                 @"video_id" : @"DbRY91rNebY"
                 },
             @{
                 @"image": @"07.png",
                 @"title" : @"Shahana Shah Cement Nirmaner Taroka 2010 Performances",
                 @"duration" : @"5:04",
                 @"video_id" : @"nOJm_dJMozk"
                 },
             @{
                 @"image": @"08.png",
                 @"title" : @"Subarna Akter Chaiti Shah Cement Nirmaner Taroka 2010 Performances",
                 @"duration" : @"4:06",
                 @"video_id" : @"cB7e5xTeQOs"
                 },
             @{
                 @"image": @"09.png",
                 @"title" : @"Adi Shah Cement Nirmaner Taroka 2010 Performances",
                 @"duration" : @"5:37",
                 @"video_id" : @"RlDg6mQ3QBI"
                 },
             @{
                 @"image": @"10.png",
                 @"title" : @"Jahidul Islam Shah Cement Nirmaner Taroka 2010 Performances",
                 @"duration" : @"03:51",
                 @"video_id" : @"9RRZmFDmGKA"
                 }
             ];
}
*/

+ (NSArray *)videoListDurations
{
    NSArray *durations = [NSArray arrayWithObjects:
                          @"03:21",
                          @"02:15",
                          @"03:57",
                          @"02:18",
                          @"02:42",
                          @"03:05",
                          @"02:28",
                          @"03:11",
                          @"04:03",
                          @"02:17",
                          @"02:35",
                          @"03:21",
                          @"02:58",
                          @"01:45",
                          @"02:21",
                          @"01:16",
                          @"03:36",
                          @"02:27",
                          @"02:47",
                          //@"03:07",
                          @"02:27",
                          @"04:57",
                          @"01:50",
                          @"02:27",
                          @"03:28",
                          @"03:48",
                          @"04:37",
                          @"02:27",
                          @"03:41",
                          nil];
    return durations;
}

+ (NSArray *)videoListIds
{
    NSArray *ids = [NSArray arrayWithObjects:
                          @"a3VMQdVvgdw",
                          @"ZkWP-J5uh48",
                          @"QjcEaOjwF8Q",
                          @"kh_odUoKUqE",
                          @"KpPlRdAzG7k",
                          @"kt5YJXOtXgc",
                          @"MRtRsZNaBmU",
                          @"_SSdrWL8XTg",
                          @"sEBzAcnWncE",
                          @"HDcU-FHcZ3E",
                          @"B7CZ0T17Ti8",
                          @"hZPfaFIIcx8",
                          @"i0U4G5X860Y",
                          @"kkfpkAKYwF0",
                          @"baiVDBJ2pYM",
                          @"hUFhpIgGq3E",
                          @"8Kqvxkgq-M0",
                          @"mVcALz_JWTs",
                          @"9bNpcIsgm8I",
                          //@"NXdaauVYA6U",
                          @"reUPZAlTPGc",
                          @"lN62_bDVaTM",
                          @"eQxkzvZ3h_Y",
                          @"kyKnnr9W6Xo",
                          @"rV1ElQHzsuA",
                          @"3m8GbDBkelo",
                          @"7DeQQCN66V8",
                          @"2-n_y2RmqjI",
                          @"AGo2TvtxtJo",
                          nil];
    return ids;
}

+ (NSArray *)videoListTitles
{
    NSArray *titles = [NSArray arrayWithObjects:
                       @"Design",
                       @"Mati Porikkha o Vumi Jorip",
                       @"Site Preparation and Layout",
                       @"Piling",
                       @"Foundation",
                       @"Formwork and Shuttering",
                       @"Rod binding and Placement",
                       @"Eet er gathuni",
                       @"Concrete Dhalai",
                       @"Plaster",
                       @"Curing",
                       @"Eet",
                       @"Bali",
                       @"Khoya",
                       @"Pathor",
                       @"Pani",
                       @"Cement",
                       @"Rod",
                       @"Concrete",
                       //@"Ready Mix Concrete",
                       @"Kaath",
                       @"Tiles",
                       @"Marbel o Granait",
                       @"Rong",
                       @"Glass o Alumunium",
                       @"Sanitary Samogri",
                       @"Electrical Works",
                       @"Fire Safety",
                       @"Vumikompo Sotorkota",
                    nil];
    return titles;
}

+ (NSArray *)videoListThumbnails
{
    NSArray *thumbs = [NSArray arrayWithObjects:
                    @"https://img.youtube.com/vi/a3VMQdVvgdw/0.jpg",
                    @"https://img.youtube.com/vi/ZkWP-J5uh48/0.jpg",
                    @"https://img.youtube.com/vi/QjcEaOjwF8Q/0.jpg",
                    @"https://img.youtube.com/vi/kh_odUoKUqE/0.jpg",
                    @"https://img.youtube.com/vi/KpPlRdAzG7k/0.jpg",
                    @"https://img.youtube.com/vi/kt5YJXOtXgc/0.jpg",
                    @"https://img.youtube.com/vi/MRtRsZNaBmU/0.jpg",
                    @"https://img.youtube.com/vi/_SSdrWL8XTg/0.jpg",
                    @"https://img.youtube.com/vi/sEBzAcnWncE/0.jpg",
                    @"https://img.youtube.com/vi/HDcU-FHcZ3E/0.jpg",
                    @"https://img.youtube.com/vi/B7CZ0T17Ti8/0.jpg",
                    @"https://img.youtube.com/vi/hZPfaFIIcx8/0.jpg",
                    @"https://img.youtube.com/vi/i0U4G5X860Y/0.jpg",
                    @"https://img.youtube.com/vi/kkfpkAKYwF0/0.jpg",
                    @"https://img.youtube.com/vi/baiVDBJ2pYM/0.jpg",
                    @"https://img.youtube.com/vi/hUFhpIgGq3E/0.jpg",
                    @"https://img.youtube.com/vi/8Kqvxkgq-M0/0.jpg",
                    @"https://img.youtube.com/vi/mVcALz_JWTs/0.jpg",
                    @"https://img.youtube.com/vi/9bNpcIsgm8I/0.jpg",
                    //@"https://img.youtube.com/vi/NXdaauVYA6U/0.jpg",
                    @"https://img.youtube.com/vi/reUPZAlTPGc/0.jpg",
                    @"https://img.youtube.com/vi/lN62_bDVaTM/0.jpg",
                    @"https://img.youtube.com/vi/eQxkzvZ3h_Y/0.jpg",
                    @"https://img.youtube.com/vi/kyKnnr9W6Xo/0.jpg",
                    @"https://img.youtube.com/vi/rV1ElQHzsuA/0.jpg",
                    @"https://img.youtube.com/vi/3m8GbDBkelo/0.jpg",
                    @"https://img.youtube.com/vi/7DeQQCN66V8/0.jpg",
                    @"https://img.youtube.com/vi/2-n_y2RmqjI/0.jpg",
                    @"https://img.youtube.com/vi/AGo2TvtxtJo/0.jpg",
                    nil];
    return thumbs;
}

@end
