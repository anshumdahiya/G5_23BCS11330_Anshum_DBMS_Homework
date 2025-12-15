CREATE OR REPLACE VIEW VW_INVOICE_SUMMARY
AS 
SELECT I.invoice_id, I.invoice_date, C.client_name, S.service_name, 
((((S.hourly_rate*I.hours_worked) * (100-I.discount_percent))/100)::numeric(10,2)) as total
FROM invoice_details AS I
JOIN 
client_master as C
ON 
I.client_id = C.client_id
JOIN 
Service_catalog as S
ON 
S.service_id = I.service_id


SELECT * FROM VW_INVOICE_SUMMARY

CREATE  ROLE ARJUN
WITH LOGIN PASSWORD 'SHALABH2012@'


GRANT SELECT ON VW_INVOICE_SUMMARY TO ARJUN

REVOKE SELECT ON VW_INVOICE_SUMMARY FROM ARJUN

SELECT CURRENT_USER