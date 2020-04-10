prompt - insert   25 rows into oehr_countries
set define off

begin
insert into oehr_countries (country_id,country_name,region_id) values ('AR','Argentina',2);
insert into oehr_countries (country_id,country_name,region_id) values ('AU','Australia',3);
insert into oehr_countries (country_id,country_name,region_id) values ('BE','Belgium',1);
insert into oehr_countries (country_id,country_name,region_id) values ('BR','Brazil',2);
insert into oehr_countries (country_id,country_name,region_id) values ('CA','Canada',2);
insert into oehr_countries (country_id,country_name,region_id) values ('CH','Switzerland',1);
insert into oehr_countries (country_id,country_name,region_id) values ('CN','China',3);
insert into oehr_countries (country_id,country_name,region_id) values ('DE','Germany',1);
insert into oehr_countries (country_id,country_name,region_id) values ('DK','Denmark',1);
insert into oehr_countries (country_id,country_name,region_id) values ('EG','Egypt',4);
insert into oehr_countries (country_id,country_name,region_id) values ('FR','France',1);
insert into oehr_countries (country_id,country_name,region_id) values ('HK','HongKong',3);
insert into oehr_countries (country_id,country_name,region_id) values ('IL','Israel',4);
insert into oehr_countries (country_id,country_name,region_id) values ('IN','India',3);
insert into oehr_countries (country_id,country_name,region_id) values ('IT','Italy',1);
insert into oehr_countries (country_id,country_name,region_id) values ('JP','Japan',3);
insert into oehr_countries (country_id,country_name,region_id) values ('KW','Kuwait',4);
insert into oehr_countries (country_id,country_name,region_id) values ('MX','Mexico',2);
insert into oehr_countries (country_id,country_name,region_id) values ('NG','Nigeria',4);
insert into oehr_countries (country_id,country_name,region_id) values ('NL','Netherlands',1);
insert into oehr_countries (country_id,country_name,region_id) values ('SG','Singapore',3);
insert into oehr_countries (country_id,country_name,region_id) values ('UK','United Kingdom',1);
insert into oehr_countries (country_id,country_name,region_id) values ('US','United States of America',2);
insert into oehr_countries (country_id,country_name,region_id) values ('ZM','Zambia',4);
insert into oehr_countries (country_id,country_name,region_id) values ('ZW','Zimbabwe',4);
end;
/

commit;
