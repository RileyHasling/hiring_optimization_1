--Standardize and finalize opv scores
WITH stats AS (
  SELECT 
    AVG(avg_opv) AS mean_opv,
    STDDEV(avg_opv) AS stddev_opv
  FROM opv_summary
)
SELECT 
  o.occupation,
  o.avg_opv,
  ROUND((o.avg_opv - s.mean_opv) / s.stddev_opv, 6) AS standardized_opv
FROM opv_summary o
CROSS JOIN stats s;

/*
Final opv scores:
Management/finance: 0.68
Sales: -1.06
Architecture/engineering: 0.59
Life sciences: 0.99
Law: -1.42
Production/transportation: 0.22
*/