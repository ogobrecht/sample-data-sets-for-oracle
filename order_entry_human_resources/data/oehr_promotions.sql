prompt - insert    2 rows into oehr_promotions
set define off

begin
insert into oehr_promotions (promo_id,promo_name) values (1,'everyday low price');
insert into oehr_promotions (promo_id,promo_name) values (2,'blowout sale');
end;
/

commit;
