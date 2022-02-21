--
--  Author: Hari Sekhon
--  Date: 2020-08-05 12:52:58 +0100 (Wed, 05 Aug 2020)
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

-- Running queries for PostgreSQL <= 9.1
--
-- Requires PostgreSQL <= 9.1
--
-- Tested on PostgreSQL 8.4, 9.0, 9.1

SELECT
  procpid,
  age(clock_timestamp(), query_start),
  usename,
  current_query
FROM
  pg_stat_activity
WHERE
  current_query != '<IDLE>'
    AND
  current_query NOT ILIKE '%pg_stat_activity%'
ORDER BY
  query_start DESC;
