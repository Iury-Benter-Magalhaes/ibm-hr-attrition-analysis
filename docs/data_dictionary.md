# Dicionário de Dados

Dataset: IBM HR Analytics Employee Attrition & Performance
Fonte: Kaggle (pavansubhasht/ibm-hr-analytics-attrition-dataset)
Total: 1.470 registros, 35 colunas

## Colunas

| Coluna | Tipo | Descrição |
|---|---|---|
| Age | Int | Idade do funcionário |
| Attrition | Texto | Se o funcionário saiu da empresa (Yes/No) |
| BusinessTravel | Texto | Frequência de viagens a trabalho |
| DailyRate | Int | Taxa diária de remuneração |
| Department | Texto | Departamento (Sales, R&D, HR) |
| DistanceFromHome | Int | Distância de casa até o trabalho (km) |
| Education | Int | Nível de escolaridade (ver escala abaixo) |
| EducationField | Texto | Área de formação |
| EmployeeCount | Int | Constante (sempre 1) — sem valor analítico |
| EmployeeNumber | Int | Identificador único do funcionário |
| EnvironmentSatisfaction | Int | Satisfação com o ambiente (ver escala abaixo) |
| Gender | Texto | Gênero |
| HourlyRate | Int | Taxa horária de remuneração |
| JobInvolvement | Int | Nível de envolvimento com o trabalho (ver escala abaixo) |
| JobLevel | Int | Nível hierárquico do cargo (1 a 5) |
| JobRole | Texto | Cargo específico |
| JobSatisfaction | Int | Satisfação com o trabalho (ver escala abaixo) |
| MaritalStatus | Texto | Estado civil |
| MonthlyIncome | Int | Salário mensal |
| MonthlyRate | Int | Taxa mensal (não é o salário) |
| NumCompaniesWorked | Int | Número de empresas em que já trabalhou |
| Over18 | Texto | Se é maior de 18 anos — constante (sempre Y/Yes) |
| OverTime | Texto | Se faz hora extra (Yes/No) |
| PercentSalaryHike | Int | Percentual do último aumento salarial |
| PerformanceRating | Int | Avaliação de desempenho (ver escala abaixo) |
| RelationshipSatisfaction | Int | Satisfação nos relacionamentos de trabalho (ver escala abaixo) |
| StandardHours | Int | Carga horária padrão — constante (sempre 80) |
| StockOptionLevel | Int | Nível de participação acionária (0 a 3) |
| TotalWorkingYears | Int | Total de anos de experiência profissional |
| TrainingTimesLastYear | Int | Quantidade de treinamentos no último ano |
| WorkLifeBalance | Int | Equilíbrio vida-trabalho (ver escala abaixo) |
| YearsAtCompany | Int | Anos na empresa atual |
| YearsInCurrentRole | Int | Anos no cargo atual |
| YearsSinceLastPromotion | Int | Anos desde a última promoção |
| YearsWithCurrManager | Int | Anos com o gestor atual |

## Escalas de código

**Education**
1 = Below College | 2 = College | 3 = Bachelor | 4 = Master | 5 = Doctor

**EnvironmentSatisfaction / JobInvolvement / JobSatisfaction / RelationshipSatisfaction / WorkLifeBalance**
1 = Low | 2 = Medium | 3 = High | 4 = Very High

*(WorkLifeBalance usa: 1 = Bad | 2 = Good | 3 = Better | 4 = Best)*

**PerformanceRating**
1 = Low | 2 = Good | 3 = Excellent | 4 = Outstanding

> Observação: o dataset não contém nenhum registro com PerformanceRating 1 ou 2 — todos os funcionários estão avaliados como 3 (Excellent) ou 4 (Outstanding).

## Colunas removidas na camada Silver (view)

As colunas abaixo foram excluídas da `vw_clean_hr_employee_attrition` por serem constantes e não agregarem valor analítico:
- `EmployeeCount` (sempre 1)
- `StandardHours` (sempre 80)

A coluna `Over18` foi mantida, mas padronizada de `Y` para `Yes`.
