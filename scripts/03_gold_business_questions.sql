-- 1. Qual o percentual geral de attrition da empresa?
SELECT 
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) total_yes,
    COUNT(*) total_funcionarios,
    CAST(COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS DECIMAL (10,1))
    / COUNT(*) * 100 total_percentual
FROM vw_clean_hr_employee_attrition;

-- 2. Qual o percentual de attrition por departamento e cargo?
SELECT
    Department,
    JobRole,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS total_saidas,
    COUNT(*) AS total_funcionarios,
    ROUND(
        CAST(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS DECIMAL(10,2)) 
        / COUNT(*) * 100
    , 1) AS percentual_attrition
FROM vw_clean_hr_employee_attrition
GROUP BY Department, JobRole;

--3. Funcionários que fazem overtime têm attrition maior?
SELECT 
    overtime,
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) total_attrition,
    COUNT(*) total_funcionarios,
    ROUND(
    CAST(COUNT(CASE WHEN attrition = 'Yes' THEN 1 END)  AS DECIMAL (10,1)) / COUNT(*) * 100 ,0) overtime_percent
FROM vw_clean_hr_employee_attrition
GROUP BY overtime;

--4. Existe relação entre satisfação no trabalho e attrition?
SELECT
    JobSatisfaction,
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) total_attrition,
    COUNT(*) total_funcionários,
    ROUND(
    CAST(COUNT(CASE WHEN attrition = 'Yes' THEN 1 End) AS DECIMAL (10,2)) / COUNT(*) * 100 , 1)percent_JobSatisfaction
FROM vw_clean_hr_employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


--5. Funcionários mais jovens ou com menos tempo de empresa têm attrition maior?
SELECT 
CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    END faixa_etaria,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) total_attrition,
COUNT(*) total_funcionarios,
CAST(COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS DECIMAL (10,1)) / COUNT(*) * 100 percentual_attrition
FROM vw_clean_hr_employee_attrition
GROUP BY
    CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    END;

--6. Salário mais baixo está associado a maior attrition?
SELECT
    CASE 
        WHEN MonthlyIncome < 3000 THEN 'Até 3000'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN '3000-6000'
        WHEN MonthlyIncome BETWEEN 6001 AND 10000 THEN '6001-10000'
        ELSE 'Acima de 10000'
    END AS faixa_salarial,
COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS total_attrition,
COUNT(*) AS total_funcionarios,
ROUND(
CAST(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS DECIMAL(10,1)) / COUNT(*) * 100,1) percentual_attrition
FROM vw_clean_hr_employee_attrition
GROUP BY 
    CASE 
        WHEN MonthlyIncome < 3000 THEN 'Até 3000'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN '3000-6000'
        WHEN MonthlyIncome BETWEEN 6001 AND 10000 THEN '6001-10000'
        ELSE 'Acima de 10000'
    END;

    --7. A distância de casa até o trabalho influencia o attrition?
    SELECT 
    CASE
        WHEN DistanceFromHome <= 5 THEN 'Perto'
        WHEN DistanceFromHome BETWEEN 6 AND 15 THEN 'Média Distância'
        ELSE 'Longe'
        END distância,
        COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS total_attrition,
COUNT(*) AS total_funcionarios,
ROUND(
CAST(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS DECIMAL(10,1)) / COUNT(*) * 100,1) percentual_attrition
FROM vw_clean_hr_employee_attrition
GROUP BY
CASE
        WHEN DistanceFromHome <= 5 THEN 'Perto'
        WHEN DistanceFromHome BETWEEN 6 AND 15 THEN 'Média Distância'
        ELSE 'Longe'
        END;

    
