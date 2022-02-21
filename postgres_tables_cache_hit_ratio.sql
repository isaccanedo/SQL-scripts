--
--  Author: Hari Sekhon
--  Date: 2020-08-05 14:57:37 +0100 (Wed, 05 Aug 2020)
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

-- PostgreSQL Tables Cache-hit Ratio
--
-- should be closer to 1, eg. 0.99, at least 0.90
--
-- otherwise increase 'shared_buffer' size (should be at least 25% of total RAM for a dedicated DB server)
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
  SUM(heap_blks_read) AS heap_blks_read,
  SUM(heap_blks_hit)  AS heap_blks_hit,
           SUM(heap_blks_hit) /
  GREATEST(SUM(heap_blks_hit) + SUM(heap_blks_read), 1)::float
                AS ratio
FROM
  pg_statio_user_tables;
