%let pgm=utl-use-geo-fencing-to-find-all-addresses-in-a-latitude-longitude-quadrangle-reverse-geocoding;

%stop_submission;

Use geo fencing to find all addresses in a latitude longitude quadrangle reverse geocoding

https://tinyurl.com/5cyvtnrs                                                                                                     
https://github.com/rogerjdeangelis/utl-use-geo-fencing-to-find-all-addresses-in-a-latitude-longitude-quadrangle-reverse-geocoding


  CONTENTS

    MANUAL OPERATIONS (I could not do this two steps programatically, ms onedrive security issue?)

      1  download adr_fix132e6.exe 1432 million addresses (1.45gb win10) into d:/adr/exe/adr_fix132e6.exe
         https://1drv.ms/u/c/bb0f3c4c9b1dc58b/EeJAnwdAgy9Oo1C4IIzf_VIBVcUhQGZRHBZZ2ulv0gICSQ?e=LXtbdk

      2  Unzip the self extracting 7-zip file you downloaded save in d:/adr/csv/adr_fix132e6.csv
         Just click on the exe file (131,789,977 records)

    PROGRAMMED

      3  import, d:/csv/csv/adr_010adrlonlatfmt.csv, and create a sas table in
         d:/adr/sd1/adr_010adrlonlatfmt.sas7bdat  (sas table)

      4  load four latitudes and longitudes that define the fencing quadrangle

      5  Find all addresses in the fence

      6 related repos )use the new database from this repo

This solution use folders

   d:/adr/exe - where I put the downloader adr_fix132e6.exe
   d:/adr/csv - where I save the unzipped file
   d:/adr/sd1 - where I save the addrees database adr_010adrlonlatfmt.sas7bdat
   d:/adr/sd1 - where I save the geo-fence havGps.sas7bdat

 /*                   _                                 __
   ___ _ __ ___  __ _| |_ ___    __ _  ___  ___  _____ / _| ___ _ __   ___ ___
  / __| `__/ _ \/ _` | __/ _ \  / _` |/ _ \/ _ \|_____| |_ / _ \ `_ \ / __/ _ \
 | (__| | |  __/ (_| | ||  __/ | (_| |  __/ (_) |_____|  _|  __/ | | | (_|  __/
  \___|_|  \___|\__,_|\__\___|  \__, |\___|\___/      |_|  \___|_| |_|\___\___|
                                |___/
 */

                              LONGITUDE

        -121.8+31  -121.83075 -121.8305 -121.83025  -121.83
            +-----------+---------+----------+----------+----+
          0 |                                                |
     37.242 + +-----------------QUADRANGLE----------------+  + 37.242
            | |          |          |          |          |  |
            | |          |          |          |          |  |
            | |          |          | * 6      |      1 * |  |
            | |  * 0     |          |          |* 3       |  |
   37.24175 + |-------------------------------------------|  + 37.24175
 L          | |          |          |          |          |  |           L
 A          | |          |          |          |          |  |           A
 T          | |          |          |          |          |  |           T
 I          | |          |          |          |* 5   2 * |  |           I
 T  37.2415 + |--* 9-----|----------|- * 8-----|----------|  + 37.2415   T
 U          | |          |          |          |          |  |           U
 D          | |          |          |          |          |  |           D
 E          | |          |          |          |          |  |           E
            | |          |          |          |          |  |
   37.24125 + |-------------------------------------------|  + 37.24125
            | |          |          |          |          |  |
            | |          |          |          |          |  |
            | |          |          |  * 7     | * 4      |  |
            | |          |          |          |          |  |
     37.241 +-+--------------------------------+----------+  + 37.241
            |                                                |
            -_+ ----------+---------+----------+----------+---
         -121.8+31  -121.83075 -121.8305 -121.83025  -121.83

                               LONGITUDE

                     0  490 CALERO AVE CA 95123
                     1  491 SHAWNEE LN CA 95123
                     2  494 CALERO AVE CA 95123
                     3  494 SHAWNEE LN CA 95123
                     4  495 SHAWNEE LN CA 95123
                     5  498 CALERO AVE CA 95123
                     6  498 SHAWNEE LN CA 95123
                     7  499 SHAWNEE LN CA 95123
                     8  501 SHAWNEE LN CA 95123
                  9  502 CALERO AVE CA 95123


/*___                      __ _ _
|___ \    ___ _____   __  / _(_) | ___
  __) |  / __/ __\ \ / / | |_| | |/ _ \
 / __/  | (__\__ \\ V /  |  _| | |  __/
|_____|  \___|___/ \_/   |_| |_|_|\___|

*/
data _null_;
 infile "d:/adr/csv/adr_fix132e6.csv";
 input;
 put _infile_;
 if _n_=11 then stop;
run;quit;

/**************************************************************************************************************************/
/* d:/adr/csv/d:/adr/csv/adr_fix132e6.csv  (131,789,977 records)                                                          */
/*                                                                                                                        */
/* MATCHCODE,ZIP4,STATE,ADR,AVGLON,AVGLAT                                                                                 */
/* 0008SCOUNTYRD50W46701,4670,IN,0008 S COUNTY RD 50 W 46701,-85.44081,41.3513                                            */
/* 0009ECOUNTYRD1050N46784,4678,IN,0009 E COUNTY RD 1050 N 46784,-85.42322,41.50108                                       */
/* 000BELLVALERD07046,0704,NJ,000 BELLVALE RD 07046,-74.42985,40.89064                                                    */
/* 0010NCOUNTYRD375W46701,4670,IN,0010 N COUNTY RD 375 W 46701,-85.4898,41.35255                                          */
/* 0010WCOUNTYRD900N46794,4679,IN,0010 W COUNTY RD 900 N 46794,-85.42382,41.48246                                         */
/* 00126THST07410,0741,NJ,001 26TH ST 07410,-74.10739,40.91937                                                            */
/* 00127THST07410,0741,NJ,001 27TH ST 07410,-74.10657,40.91959                                                            */
/* 00128THST07410,0741,NJ,001 28TH ST 07410,-74.1057,40.91983                                                             */
/* 00129THST07410,0741,NJ,001 29TH ST 07410,-74.10483,40.92009                                                            */
/* 0012ANTHONYPL02840,0284,RI,0012 ANTHONY PL 02840,-71.31617,41.47072                                                    */
/**************************************************************************************************************************/

/*____   _                            _
|___ /  (_)_ __ ___  _ __   ___  _ __| |_    ___ _____   __
  |_ \  | | `_ ` _ \| `_ \ / _ \| `__| __|  / __/ __\ \ / /
 ___) | | | | | | | | |_) | (_) | |  | |_  | (__\__ \\ V /
|____/  |_|_| |_| |_| .__/ \___/|_|   \__|  \___|___/ \_/
                    |_|
*/

options ls=255 ps=66;

libname adr "d:/adr/sd1";

data adr.adr_010adrlonlatfmt(compress=char);
   infile 'd:/adr/csv/adr_fix132e6.csv'
      /*---- SKIP FIRST ROW ----*/
      firstobs=2 delimiter=',' DSD lrecl=32767;
   informat MATCHCODE $64. ;
   informat ZIP4 $4. ;
   informat STATE $2. ;
   informat ADR $64. ;
   informat AVGLAT best12. ;
   informat AVGLON best12. ;
   input
      MATCHCODE
      ZIP4
      STATE
      ADR
      AVGLON
      AVGLAT
   ;
   if mod(_n_,10000000)=0 then put _n_ comma15.;
run;quit;

/*---- Records read

  10,000,000
  20,000,000
  30,000,000
  40,000,000
  50,000,000
  60,000,000
  70,000,000
  80,000,000
  90,000,000
 100,000,000
 110,000,000
 120,000,000
 130,000,000
 140,000,000

NOTE: The data set ADR.ADR_010ADRLONLATFMT has 141882890 observations and 6 variables.

NOTE: DATA statement used (Total process time):
     real time           2:20.74

----*/

proc print data=adr.adr_010adrlonlatfmt(obs=10);
format avglat avglon 12.5;
run;quit;


/**************************************************************************************************************************/
/*  MATCHCODE                     ZIP4    STATE    ADR                                  AVGLAT     AVGLON                 */
/*                                                                                                                        */
/*  0008SCOUNTYRD50W46701         4670     IN      0008 S COUNTY RD 50 W 46701         41.3513    -85.4408                */
/*  0009ECOUNTYRD1050N46784       4678     IN      0009 E COUNTY RD 1050 N 46784       41.5011    -85.4232                */
/*  000BELLVALERD07046            0704     NJ      000 BELLVALE RD 07046               40.8906    -74.4299                */
/*  0010NCOUNTYRD375W46701        4670     IN      0010 N COUNTY RD 375 W 46701        41.3526    -85.4898                */
/*  0010WCOUNTYRD900N46794        4679     IN      0010 W COUNTY RD 900 N 46794        41.4825    -85.4238                */
/*  00126THST07410                0741     NJ      001 26TH ST 07410                   40.9194    -74.1074                */
/*  00127THST07410                0741     NJ      001 27TH ST 07410                   40.9196    -74.1066                */
/*  00128THST07410                0741     NJ      001 28TH ST 07410                   40.9198    -74.1057                */
/*  00129THST07410                0741     NJ      001 29TH ST 07410                   40.9201    -74.1048                */
/*                                                                                                                        */
/*                                                                                                                        */
/*  Data Set Name        ADR.ADR_010ADRLONLATFMT       Observations           141,882,890                                 */
/*  Member Type          DATA                          Variables              6                                           */
/*                                                                                                                        */
/*                                                                                                                        */
/*         Variables in Creation Order                                                                                    */
/*                                                                                                                        */
/*  #    Variable     Type    Len    Informat                                                                             */
/*                                                                                                                        */
/*  1    MATCHCODE    Char     64    $64.                                                                                 */
/*  2    ZIP4         Char      4    $4.                                                                                  */
/*  3    STATE        Char      2    $2.                                                                                  */
/*  4    ADR          Char     64    $64.                                                                                 */
/*  5    AVGLAT       Num       8    BEST12.                                                                              */
/*  6    AVGLON       Num       8    BEST12.                                                                              */
/**************************************************************************************************************************/

/*  _                        __
| || |     __ _  ___  ___   / _| ___ _ __   ___ ___
| || |_   / _` |/ _ \/ _ \ | |_ / _ \ `_ \ / __/ _ \
|__   _| | (_| |  __/ (_) ||  _|  __/ | | | (_|  __/
   |_|    \__, |\___|\___/_|_|  \___|_| |_|\___\___|
          |___/         |___|
                           _
 ___  __ _ _ __ ___  _ __ | | ___   __ _ _   _  __ _  __| |_ __ __ _ _ __   __ _| | ___
/ __|/ _` | `_ ` _ \| `_ \| |/ _ \ / _` | | | |/ _` |/ _` | `__/ _` | `_ \ / _` | |/ _ \
\__ \ (_| | | | | | | |_) | |  __/| (_| | |_| | (_| | (_| | | | (_| | | | | (_| | |  __/
|___/\__,_|_| |_| |_| .__/|_|\___| \__, |\__,_|\__,_|\__,_|_|  \__,_|_| |_|\__, |_|\___|
                    |_|               |_|                                  |___/
*/

libname sd1 "d:/sd1";
data sd1.havGps;
length intlatlon $8;
input lat lon;
intlatlon = cats(put(int(lat),z4.),put(int(lon),z4.));
keep lat lon intlatlon;
cards4;
37.242 -121.830
37.242 -121.831
37.241 -121.830
37.241 -121.831
;;;;
run;quit;

/**************************************************************************************************************************/
/*   INTLATLON      LAT        LON                                                                                        */
/*                                                                                                                        */
/*   0037-121     37.242    -121.830                                                                                      */
/*   0037-121     37.242    -121.831                                                                                      */
/*   0037-121     37.241    -121.830                                                                                      */
/*   0037-121     37.241    -121.831                                                                                      */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___     __ _           _             _     _                          _          __
| ___|   / _(_)_ __   __| |   __ _  __| | __| |_ __ ___  ___  ___  ___ (_)_ __    / _| ___ _ __   ___ ___
|___ \  | |_| | `_ \ / _` |  / _` |/ _` |/ _` | `__/ _ \/ __|/ _ \/ __|| | `_ \  | |_ / _ \ `_ \ / __/ _ \
 ___) | |  _| | | | | (_| | | (_| | (_| | (_| | | |  __/\__ \  __/\__ \| | | | | |  _|  __/ | | | (_|  __/
|____/  |_| |_|_| |_|\__,_|  \__,_|\__,_|\__,_|_|  \___||___/\___||___/|_|_| |_| |_|  \___|_| |_|\___\___|
*/


data adr_010adrqud ;
   set adrfin.adr_fix132e6(
     where= (
        37.241 <= avglat <= 37.242 and
        -121.831 <= avglon <= -121.830)
     );
run;quit;

proc print data=adr_010adrqud ;
 format avglat avglon 13.6;
run;quit;


/**************************************************************************************************************************/
/*     MATCHCODE        ZIP4    STATE            ADR               AVGLAT       AVGLON                                    */
/*                                                                                                                        */
/* 490CALEROAVE95123    9512     CA      490 CALERO AVE 95123   37.241860   -121.830025                                   */
/* 491SHAWNEELN95123    9512     CA      491 SHAWNEE LN 95123   37.241530   -121.830015                                   */
/* 494CALEROAVE95123    9512     CA      494 CALERO AVE 95123   37.241800   -121.830225                                   */
/* 494SHAWNEELN95123    9512     CA      494 SHAWNEE LN 95123   37.241085   -121.830175                                   */
/* 495SHAWNEELN95123    9512     CA      495 SHAWNEE LN 95123   37.241550   -121.830220                                   */
/* 498CALEROAVE95123    9512     CA      498 CALERO AVE 95123   37.241830   -121.830430                                   */
/* 498SHAWNEELN95123    9512     CA      498 SHAWNEE LN 95123   37.241105   -121.830400                                   */
/* 499SHAWNEELN95123    9512     CA      499 SHAWNEE LN 95123   37.241520   -121.830420                                   */
/* 501SHAWNEELN95123    9512     CA      501 SHAWNEE LN 95123   37.241510   -121.830950                                   */
/* 502CALEROAVE95123    9512     CA      502 CALERO AVE 95123   37.241740   -121.830960                                   */
/**************************************************************************************************************************/


/*__              _       _           _
 / /_    _ __ ___| | __ _| |_ ___  __| |  _ __ ___ _ __   ___  ___
| `_ \  | `__/ _ \ |/ _` | __/ _ \/ _` | | `__/ _ \ `_ \ / _ \/ __|
| (_) | | | |  __/ | (_| | ||  __/ (_| | | | |  __/ |_) | (_) \__ \
 \___/  |_|  \___|_|\__,_|\__\___|\__,_| |_|  \___| .__/ \___/|___/
                                                  |_|
*/

These repose need to rerun with the new data base. I will try to update them.

REPO
----------------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/utl_geocode_reverse_geocode
https://github.com/rogerjdeangelis/utl-dept-of-trans-address-database-to-sas-wps-tables-for-geocoding-and-reverse-geocoding
https://github.com/rogerjdeangelis/utl-free-unlimited-geocoding-reverse-geocoding-wps-aprox-I41-million-addresses-with-gps
https://github.com/rogerjdeangelis/utl-given-a-list-of-messy-addresses-geocode-and-reverse-geocode-using-us-address-database
https://github.com/rogerjdeangelis/utl-openaddress-database-to-sas-wps-tables-for-geocoding-and-reverse-geocoding
https://github.com/rogerjdeangelis/utl-standardize-address-suffix-using-usps-abreviations
https://github.com/rogerjdeangelis/utl-validate-email-address-and-domain-python
https://github.com/rogerjdeangelis/utl_US_address-standardization
https://github.com/rogerjdeangelis/utl_geocode_and_reverse_geocode_netherland_addresses_and_latitudes_longitudes

                                                                                                                              
https://github.com/rogerjdeangelis/utl-add-points-to-a-map-of-slovakia                                                        
https://github.com/rogerjdeangelis/utl-creating-zipcode-zcta-choropleth-maps-in-R-and-SAS                                     
https://github.com/rogerjdeangelis/utl-drawing-a-world-map-using-the-eckert-projection-ggplot-map-rnaturalearth               
https://github.com/rogerjdeangelis/utl-gis-census-zipcode-maps-no-credit-card-api-or-restrictions-wps-r-tmap                  
https://github.com/rogerjdeangelis/utl-gis-mapping-with-r-package-rnaturalearth-no-api-credit-card-or-access-limits-          
https://github.com/rogerjdeangelis/utl-given-latitude-and-longitude-determine-the-us-state-mapping                            
https://github.com/rogerjdeangelis/utl-programatically-download-census-tiger-shapefiles-and-map-us-labeling-largest-cities    
https://github.com/rogerjdeangelis/utl-usmap-drilldown                                                                        
https://github.com/rogerjdeangelis/utl_driving_distance_from_city_to_city_using_google_maps                                   
https://github.com/rogerjdeangelis/utl_google_and_SAS_maps                                                                    
https://github.com/rogerjdeangelis/utl_google_map_of_USA_with_long_and_lat_and_earnings                                       
https://github.com/rogerjdeangelis/utl_google_map_of_earnings_for_canada_cities                                               
https://github.com/rogerjdeangelis/utl_graphics_zipcode_boundary_maps                                                         
https://github.com/rogerjdeangelis/utl_javascript_and_classic_map_graphics_with_mouseovers_and_multiple_drilldowns            
https://github.com/rogerjdeangelis/utl_map_counties_within_one_state_choropleth_map                                           
https://github.com/rogerjdeangelis/utl_proc_gmap_classic_graphics_grid_containing_four_states                                 
https://github.com/rogerjdeangelis/utl_where_am_i_show_the_street_or_satelite_map                                             
                                                                                                                              

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
