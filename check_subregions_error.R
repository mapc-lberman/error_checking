library(tidyverse)
library(tidycensus)
library(stringi)
library(stringr)
library(dplyr)
library(tidyr)

# lberman 2026-05-07  

# Brooke found mixup between muni_id 358 and 359
# Table: b25091_b25070_costburden_acs_m

# see slack # dgs-sprints "North Shore Task Force [NSTF]"

## check values in db
# pull year from db

# Load the library
library(jsonlite)

# API URL GET FROM STAGING to keep raw header

table_nm <- "b25091_b25070_costburden_acs_m"

# check 2015-19
query_yr = "2015-19"
url <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2015_19 <- fromJSON(url)
ck_rgn_2015_19 <- data_2015_19 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,occv2,own_occ,r_occv2))

# check 2014-18
query_yr = "2014-18"
url_b <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2014_18 <- fromJSON(url_b)
ck_rgn_2014_18 <- data_2014_18 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,occv2,own_occ,r_occv2))



# check 2013-17
query_yr = "2013-17"
url_c <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2013_17 <- fromJSON(url_c)
ck_rgn_2013_17 <- data_2013_17 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,occv2,own_occ,r_occv2))


# check 2017-21
query_yr = "2017-21"
url_d <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2017_21 <- fromJSON(url_d)
ck_rgn_2017_21 <- data_2017_21 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,occv2,own_occ,r_occv2))


# check 2018-22
query_yr = "2018-22"
url_e <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2018_22 <- fromJSON(url_e)
ck_rgn_2018_22 <- data_2018_22 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,occv2,own_occ,r_occv2))


# check 2016-20
query_yr = "2016-20"
url_f <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2016_20 <- fromJSON(url_f)
ck_rgn_2016_20 <- data_2016_20 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,occv2,own_occ,r_occv2))


# check 2018-22
query_yr = "2018-22"
url_g <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2018_22 <- fromJSON(url_g)
ck_rgn_2018_22 <- data_2018_22 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,occv2,own_occ,r_occv2))


# bind for viewing

subregion_keys_error <- rbind(
  ck_rgn_2013_17,
  ck_rgn_2014_18,
  ck_rgn_2015_19,
  ck_rgn_2016_20,
  ck_rgn_2017_21,
  ck_rgn_2018_22
) %>% 
  arrange(muni_id,acs_year)


#### CHECK ANOTHER TABLE

table_nm <- "b25041_bedrooms_per_unit_m"

# check 2015-19
query_yr = "2015-19"
url <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2015_19 <- fromJSON(url)
ck_rgn_2015_19 <- data_2015_19 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,tot_hu,bd2,bd3u))

# check 2014-18
query_yr = "2014-18"
url_b <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2014_18 <- fromJSON(url_b)
ck_rgn_2014_18 <- data_2014_18 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,tot_hu,bd2,bd3u))



# check 2013-17
query_yr = "2013-17"
url_c <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2013_17 <- fromJSON(url_c)
ck_rgn_2013_17 <- data_2013_17 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,tot_hu,bd2,bd3u))


# check 2017-21
query_yr = "2017-21"
url_d <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2017_21 <- fromJSON(url_d)
ck_rgn_2017_21 <- data_2017_21 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,tot_hu,bd2,bd3u))


# check 2018-22
query_yr = "2018-22"
url_e <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2018_22 <- fromJSON(url_e)
ck_rgn_2018_22 <- data_2018_22 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,tot_hu,bd2,bd3u))


# check 2016-20
query_yr = "2016-20"
url_f <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2016_20 <- fromJSON(url_f)
ck_rgn_2016_20 <- data_2016_20 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,tot_hu,bd2,bd3u))


# check 2018-22
query_yr = "2018-22"
url_g <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2018_22 <- fromJSON(url_g)
ck_rgn_2018_22 <- data_2018_22 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,tot_hu,bd2,bd3u))

# check 2019-23
query_yr = "2019-23"
url_h <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2019_23 <- fromJSON(url_h)
ck_rgn_2019_23 <- data_2019_23 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,tot_hu,bd2,bd3u))

# check 2020-24
query_yr = "2020-24"
url_i <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2020_24 <- fromJSON(url_i)
ck_rgn_2020_24 <- data_2020_24 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,tot_hu,bd2,bd3u))


# bind for viewing

subregion_keys_error <- rbind(
  ck_rgn_2013_17,
  ck_rgn_2014_18,
  ck_rgn_2015_19,
  ck_rgn_2016_20,
  ck_rgn_2017_21,
  ck_rgn_2018_22,
  ck_rgn_2019_23,
  ck_rgn_2020_24
) %>% 
  arrange(muni_id,acs_year)



### THIRD TABLE

table_nm <- "b17017_poverty_by_hh_type_acs_m"

# check 2015-19
query_yr = "2015-19"
url <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2015_19 <- fromJSON(url)
ck_rgn_2015_19 <- data_2015_19 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,hh,pov_hh,np_f_p))

# check 2014-18
query_yr = "2014-18"
url_b <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2014_18 <- fromJSON(url_b)
ck_rgn_2014_18 <- data_2014_18 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,hh,pov_hh,np_f_p))



# check 2013-17
query_yr = "2013-17"
url_c <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2013_17 <- fromJSON(url_c)
ck_rgn_2013_17 <- data_2013_17 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,hh,pov_hh,np_f_p))


# check 2017-21
query_yr = "2017-21"
url_d <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2017_21 <- fromJSON(url_d)
ck_rgn_2017_21 <- data_2017_21 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,hh,pov_hh,np_f_p))


# check 2018-22
query_yr = "2018-22"
url_e <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2018_22 <- fromJSON(url_e)
ck_rgn_2018_22 <- data_2018_22 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,hh,pov_hh,np_f_p))


# check 2016-20
query_yr = "2016-20"
url_f <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2016_20 <- fromJSON(url_f)
ck_rgn_2016_20 <- data_2016_20 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,hh,pov_hh,np_f_p))


# check 2018-22
query_yr = "2018-22"
url_g <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2018_22 <- fromJSON(url_g)
ck_rgn_2018_22 <- data_2018_22 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,hh,pov_hh,np_f_p))

# check 2019-23
query_yr = "2019-23"
url_h <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2019_23 <- fromJSON(url_h)
ck_rgn_2019_23 <- data_2019_23 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,hh,pov_hh,np_f_p))

# check 2020-24
query_yr = "2020-24"
url_i <- paste0("https://staging.datacommon-react.mapc.org/api/export?token=datacommon&database=ds&schema=tabular&table=",table_nm,"&format=json&years=",query_yr,"&useMetadataColumns=false")
data_2020_24 <- fromJSON(url_i)
ck_rgn_2020_24 <- data_2020_24 %>% 
  filter(muni_id %in% c("358", "359")) %>% 
  select(c(muni_id,municipal,acs_year,hh,pov_hh,np_f_p))


# bind for viewing

subregion_keys_error <- rbind(
  ck_rgn_2013_17,
  ck_rgn_2014_18,
  ck_rgn_2015_19,
  ck_rgn_2016_20,
  ck_rgn_2017_21,
  ck_rgn_2018_22,
  ck_rgn_2019_23,
  ck_rgn_2020_24
) %>% 
  arrange(muni_id,acs_year)
