
%sql select wpi.*, l.*, pt.*,  from watershed_property_info as wpi,location as l, property_type as pt where l.location_id = wpi.location and wpi.property_type=pt.property_type_id

ws= %sql select * from watershed_property_info as wpi,location as l, property_type as pt where l.location_id = wpi.location and wpi.property_type=pt.property_type_id
ws.csv('ws.csv')	

-----------/////////----------//////////-------------////////---------///////////----------//////--------

%sql select * from st_property_info as spi, st_rental_dates as srd, location as l, property_type as pt, st_rental_prices as srp where spi.st_property_id=srd.st_property and spi.location=l.location_id and spi.property_type=pt.property_type_id and spi.location=srp.location 

st= %sql select * from st_property_info as spi, st_rental_dates as srd, location as l, property_type as pt, st_rental_prices as srp where spi.st_property_id=srd.st_property and spi.location=l.location_id and spi.property_type=pt.property_type_id and spi.location=srp.location and srd.rental_date >= "2015-01-01"
st.csv('st.csv')

-----------/////////----------//////////-------------////////---------///////////----------//////--------

t1 = %sql select ws.*, avg(st.percentile_10th_price), avg(st.percentile_90th_price), avg(st.sample_nightly_rent_price) from ws join st on ws.location = st.location_1

-----------/////////----------//////////-------------////////---------///////////----------//////--------

%sql select wpi.*, l.*, pt.*, srp.percentile_10th_price, srp.percentile_90th_price from watershed_property_info as wpi,location as l, property_type as pt, st_rental_prices as srp where l.location_id = wpi.location and wpi.property_type=pt.property_type_id and wpi.location = srp.location group by wpi.ws_property_id 


-----------/////////----------//////////-------------////////---------///////////----------//////--------


%sql select wpi.*, l.*, pt.*, avg(srp.percentile_10th_price), avg(srp.percentile_90th_price), avg(srp.sample_nightly_rent_price), dayofyear(srd.rental_date)*100/365 from watershed_property_info as wpi,location as l, property_type as pt, st_rental_prices as srp, st_rental_dates as srd where l.location_id = wpi.location and wpi.property_type=pt.property_type_id and wpi.location = srp.location and wpi.ws_property_id = srd.st_property and srd.rental_date >= "2015-01-01" group by wpi.ws_property_id

-----------/////////----------//////////-------------////////---------///////////----------//////--------

%sql select wpi.*, l.*, pt.*, avg(srp.percentile_10th_price), avg(srp.percentile_90th_price), avg(srp.sample_nightly_rent_price), dayofyear(srd.rental_date)*100/365 from watershed_property_info as wpi,location as l, property_type as pt, st_rental_prices as srp, st_rental_dates as srd where l.location_id = wpi.location and wpi.property_type=pt.property_type_id and wpi.location = srp.location and srd.rental_date >= "2015-01-01" group by wpi.ws_property_id


-----------/////////----------//////////-------------////////---------///////////----------//////--------





-----------/////////----------//////////-------------////////---------///////////----------//////--------





-----------/////////----------//////////-------------////////---------///////////----------//////--------
