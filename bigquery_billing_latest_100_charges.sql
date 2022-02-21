--
--  Author: Hari Sekhon
--  Date: 2020-02-02 00:37:06 +0000 (Sun, 02 Feb 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/harisekhon/sql
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/harisekhon
--

-- BigQuery Billing Query
--
-- latest 100 charges

SELECT
  product,
  resource_type,
  start_time,
  end_time,
  cost,
  project_id,
  project_name,
  project_labels_key,
  currency,
  currency_conversion_rate,
  usage_amount,
  usage_unit
FROM
  `myproject.mydataset.imported_billing_data`
WHERE
  cost > 0
ORDER BY
  end_time DESC
LIMIT 100;
