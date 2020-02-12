--------------------------------------------------------
--  Ref Constraints for Table OEHR_PRODUCT_DESCRIPTIONS
--------------------------------------------------------

  ALTER TABLE "OEHR_PRODUCT_DESCRIPTIONS" ADD CONSTRAINT "OEHR_PD_PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "OEHR_PRODUCT_INFORMATION" ("PRODUCT_ID") ENABLE;
