-- 1st Normal form
    -- All rows must be unique
    -- All data must also be atomic and non divisible
    -- Row order must not convey any information
    -- Mutiple data types should not exist in on column
    -- All tables must have a primary key
    -- No repeated groups
 
-- 2nd normal form
    -- Deletion and update anomaly
    /* Partial dependency: Exery column in a table should depend 
        on every primary key in a multicolumnar primary key table */

-- 3rd normal form
    /* Transitive dependency: No column should depend on another 
        columns other than that of the primary key */
    
-- 4th normal form
    /* Multivalued dependency: No one to many relations 
    in more than one independent columns */