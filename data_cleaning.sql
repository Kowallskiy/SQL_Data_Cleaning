create table tub AS
select * from TB_Alcohol;

ALTER TABLE TB_Alcohol RENAME COLUMN "_No_of_TB_-_Alcohol-TB_patients_with_known_Alcohol_usage_status,_of_notified)-Public"
TO n_used_alcohol;

ALTER TABLE TB_Alcohol RENAME COLUMN "%_of__TB_-_Alcohol-TB_patients_with_known_Alcohol_usage_status,_of_notified)-Public"
TO percentage_used_alcohol;

ALTER TABLE TB_Alcohol RENAME COLUMN "No_of__TB_-_Alcohol-TB_patients_with_known_Alcohol_usage_status,__of_notified)-Private"
TO n_used_alcohol_private;

ALTER TABLE TB_Alcohol RENAME COLUMN "%_of__TB_-_Alcohol-TB_patients_with_known_Alcohol_usage_status,__of_notified)-Private"
TO percentage_used_alcohol_private;

ALTER TABLE TB_Alcohol RENAME COLUMN "_No_of_TB_-_Alcohol-TB_patients_with_known_Alcohol_usage_status,__of_notified)-Total"
TO n_used_alcohol_total;

drop table tub;

**Analysis** 
select n_used_alcohol from TB_Alcohol
where n_used_alcohol > (SELECT AVG(n_used_alcohol) from TB_Alcohol);

ALTER TABLE TB_Alcohol RENAME COLUMN "%_of_TB_-_Alcohol-TB_patients_with_known_Alcohol_usage_status,_of_notified)-Total"
TO percentage_used_alcohol_total;

ALTER TABLE TB_Alcohol RENAME COLUMN "No_of_TB_-_Alcohol-Alcohol_users_identified_amongst_screened,_of_those_with_known_alcohol_usage_status)-Public"
TO diagnosed_tb_alc_users;

ALTER TABLE TB_Alcohol RENAME COLUMN "Percentage__of_TB_-_Alcohol-Alcohol_users_identified_amongst_screened,of_those_with_known_alcohol_usage_status)-Public"
TO percentage_diagnosed_tb_alc_users;

ALTER TABLE TB_Alcohol RENAME COLUMN "No_of_TB_-_Alcohol-Alcohol_users_identified_amongst_screened,_of_those_with_known_alcohol_usage_status)-Private"
TO diagnosed_tb_alc_users_private;

ALTER TABLE TB_Alcohol RENAME COLUMN "Percentage__of_TB_-_Alcohol-Alcohol_users_identified_amongst_screened,_of_those_with_known_alcohol_usage_status)-Private"
TO percentage_diganosed_tb_alc_users_private;

ALTER TABLE TB_Alcohol RENAME COLUMN "No_of_TB_-_Alcohol-Alcohol_users_identified_amongst_screened,__of_those_with_known_alcohol_usage_status)-Total"
TO diagnosed_tb_alc_users_total;

ALTER TABLE TB_Alcohol RENAME COLUMN "Percentage__of_TB_-_Alcohol-Alcohol_users_identified_amongst_screened,__of_those_with_known_alcohol_usage_status)-Total"
TO percentage_diagnosed_tb_alc_users_total;

ALTER TABLE TB_Alcohol RENAME COLUMN "No_of_TB_-_Alcohol-Alcohol_users_linked_with_Deaddiction_centres,_of_alcohol_users)-Public"
TO diagnosed_tb_alc_in_rehab;

ALTER TABLE TB_Alcohol RENAME COLUMN "Percentage__of_TB_-_Alcohol-Alcohol_users_linked_with_Deaddiction_centres,__of_alcohol_users)-Public"
TO percentage_diagnosed_tb_alc_in_rehab;

ALTER TABLE TB_Alcohol RENAME COLUMN "No_of_TB_-_Alcohol-Alcohol_users_linked_with_Deaddiction_centres,__of_alcohol_users)-Private"
TO diagnosed_tb_alc_in_rehab_private;

ALTER TABLE TB_Alcohol RENAME COLUMN "Percentage__of_TB_-_Alcohol-Alcohol_users_linked_with_Deaddiction_centres,__of_alcohol_users)-Private"
TO percentage_diagnosed_tb_alc_in_rehab_private;

ALTER TABLE TB_Alcohol RENAME COLUMN "No_of_TB_-_Alcohol-Alcohol_users_linked_with_Deaddiction_centres,_of_alcohol_users)-Total"
TO diagnosed_tb_alc_in_rehab_total;

ALTER TABLE TB_Alcohol RENAME COLUMN "Percentage__of_No_of_TB_-_Alcohol-Alcohol_users_linked_with_Deaddiction_centres,_of_alcohol_users)-Total"
TO percentage_diagnosed_tb_alc_in_rehab_total;

SELECT * from TB_Alcohol limit 5;

SELECT diagnosed_tb_alc_in_rehab_private,
       COUNT(*) AS count_all,
       COUNT(CASE WHEN diagnosed_tb_alc_in_rehab_private IS NULL THEN 1 END) AS count_null,
       COUNT(CASE WHEN diagnosed_tb_alc_in_rehab_private = 'NA' THEN 1 END) AS count_na
FROM TB_Alcohol
GROUP BY diagnosed_tb_alc_in_rehab_private;

UPDATE TB_Alcohol
SET diagnosed_tb_alc_in_rehab_private = 0
WHERE diagnosed_tb_alc_in_rehab_private = 'NA';

ALTER TABLE TB_Alcohol
ADD COLUMN new_column INTEGER AFTER diagnosed_tb_alc_in_rehab_private;

CREATE TABLE TB_Alcohol_temp ("State/Uts" TEXT,
                              n_used_alcohol INTEGER,
                              percentage_used_alcohol REAL,
                              n_used_alcohol_private INTEGER,
                              percentage_used_alcohol_private REAL,
                              n_used_alcohol_total INTEGER,
                              percentage_used_alcohol_total REAL,
                              diagnosed_tb_alc_users INTEGER,
                              percentage_diagnosed_tb_alc_users REAL,
                              diagnosed_tb_alc_users_private INTEGER,
                              percentage_diganosed_tb_alc_users_private REAL,
                              diagnosed_tb_alc_users_total INTEGER,
                              percentage_diagnosed_tb_alc_users_total REAL,
                              diagnosed_tb_alc_in_rehab INTEGER,
                              percentage_diagnosed_tb_alc_in_rehab REAL,
                              diagnosed_tb_alc_in_rehab_private INTEGER,
                              percentage_diagnosed_tb_alc_in_rehab_private REAL,
                              diagnosed_tb_alc_in_rehab_total INTEGER,
                              percentage_diagnosed_tb_alc_in_rehab_total REAL); 
                              
INSERT INTO TB_Alcohol_temp("State/Uts", n_used_alcohol, percentage_used_alcohol,
                            n_used_alcohol_private, percentage_used_alcohol_private,
                            n_used_alcohol_total, percentage_used_alcohol_total,
                            diagnosed_tb_alc_users, percentage_diagnosed_tb_alc_users,
                            diagnosed_tb_alc_users_private,
                            percentage_diganosed_tb_alc_users_private,
                            diagnosed_tb_alc_users_total,
                            percentage_diagnosed_tb_alc_users_total,
                            diagnosed_tb_alc_in_rehab, percentage_diagnosed_tb_alc_in_rehab,
                            diagnosed_tb_alc_in_rehab_private,
                            percentage_diagnosed_tb_alc_in_rehab_private,
                            diagnosed_tb_alc_in_rehab_total,
                            percentage_diagnosed_tb_alc_in_rehab_total)
                            SELECT "State/Uts", n_used_alcohol, percentage_used_alcohol,
                            n_used_alcohol_private, percentage_used_alcohol_private,
                            n_used_alcohol_total, percentage_used_alcohol_total,
                            diagnosed_tb_alc_users, percentage_diagnosed_tb_alc_users,
                            diagnosed_tb_alc_users_private,
                            percentage_diganosed_tb_alc_users_private,
                            diagnosed_tb_alc_users_total,
                            percentage_diagnosed_tb_alc_users_total,
                            diagnosed_tb_alc_in_rehab, percentage_diagnosed_tb_alc_in_rehab,
                            diagnosed_tb_alc_in_rehab_private, 
                            percentage_diagnosed_tb_alc_in_rehab_private, 
                            diagnosed_tb_alc_in_rehab_total, 
                            percentage_diagnosed_tb_alc_in_rehab_total 
                            FROM TB_Alcohol; 
                            
select * from TB_Alcohol_temp limit 5;
                            
DROP TABLE TB_Alcohol; 

ALTER TABLE TB_Alcohol_temp RENAME TO TB_Alcohol;