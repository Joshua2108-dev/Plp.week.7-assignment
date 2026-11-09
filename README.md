#To apply all migrations sequentially up to the current version:
flyway -url=jdbc:postgresql://localhost/bootcamp -user=postgres migrate

#Check the migration status:
flyway info

#Verification & Testing
Testing Audit Logging
UPDATE students SET name = 'Kofi M.' WHERE id = 1;
DELETE FROM students WHERE id = 3;

SELECT
  tbl,
  op,
  old_row->>'name' AS was,
  new_row->>'name' AS now,
  at
FROM audit_log
ORDER BY at DESC;


#Testing Category Tree Traversal
WITH RECURSIVE tree AS (
  SELECT id, name, parent_id, 0 AS depth
  FROM categories
  WHERE parent_id IS NULL

  UNION ALL

  SELECT c.id, c.name, c.parent_id, t.depth + 1
  FROM categories c
  JOIN tree t ON c.parent_id = t.id
)
SELECT repeat('  ', depth) || name AS tree
FROM tree
ORDER BY depth, name;
