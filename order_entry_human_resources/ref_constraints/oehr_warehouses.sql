--------------------------------------------------------
--  Ref Constraints for Table OEHR_WAREHOUSES
--------------------------------------------------------

  ALTER TABLE "OEHR_WAREHOUSES" ADD CONSTRAINT "OEHR_WAREHOUSES_LOCATION_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "OEHR_LOCATIONS" ("LOCATION_ID") ON DELETE SET NULL ENABLE;
