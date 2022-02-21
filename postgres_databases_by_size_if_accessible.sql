--
--  Author: Hari Sekhon
--  Date: 2020-08-05 17:49:13 +0100 (Wed, 05 Aug 2020)
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

-- PostgreSQL databases by size descending (only ones you can access)
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
  d.datname AS Name,
  pg_catalog.pg_get_userbyid(d.datdba) AS Owner,
  CASE WHEN pg_catalog.has_database_privilege(d.datname, 'CONNECT')
    THEN pg_catalog.pg_size_pretty(pg_catalog.pg_database_size(d.datname))
    ELSE 'No Access'
  END AS SIZE
FROM
  pg_catalog.pg_database d
ORDER BY
  CASE WHEN pg_catalog.has_database_privilege(d.datname, 'CONNECT')
    THEN pg_catalog.pg_database_size(d.datname)
    ELSE NULL
  END
  DESC;
