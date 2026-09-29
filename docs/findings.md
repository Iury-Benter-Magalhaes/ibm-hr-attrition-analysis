# Principais Descobertas (Findings)

## 1. Percentual geral de attrition
- Total de funcionários: 1.470
- Funcionários que saíram: 237
- Percentual geral de attrition: 16,1%

## 2. Attrition por departamento e cargo
- Maior attrition: Sales Representative (39,8%)
- Também em destaque: Laboratory Technician (23,9%) e Human Resources - cargo HR (23,1%)
- Menor attrition: Manager em Human Resources (0%) e Research Director (2,5%)
- Observação: cargos de venda direta (Sales Representative) e técnicos operacionais (Laboratory Technician) têm attrition bem mais alto que cargos de gestão/liderança, que se mantêm consistentemente baixos.

## 3. Overtime x Attrition
- Attrition entre quem faz overtime: 31%
- Attrition entre quem não faz overtime: 10%
- Conclusão: overtime está fortemente associado a maior attrition — quem faz hora extra sai quase 3x mais que quem não faz. Um dos fatores mais relevantes encontrados no dataset.

## 4. Satisfação no trabalho x Attrition
- JobSatisfaction 1 (Low): 22,8%
- JobSatisfaction 2 (Medium): 16,4%
- JobSatisfaction 3 (High): 16,5%
- JobSatisfaction 4 (Very High): 11,3%
- Conclusão: existe uma tendência geral de queda no attrition conforme a satisfação aumenta, embora não seja perfeitamente linear (2 e 3 ficaram próximos). O nível mais baixo (Low) e o mais alto (Very High) confirmam a hipótese nas pontas.

## 5. Idade / Tempo de empresa x Attrition
- Faixa 18-25: 35,8% (a mais alta)
- Faixa 26-35: 19,1%
- Faixa 36-45: 9,2%
- Faixa 46-60: 12,5%
- Conclusão: funcionários mais jovens (18-25) têm attrition muito mais alto que os demais grupos — mais que o triplo da faixa 36-45. É um dos padrões mais claros do dataset.

## 6. Salário x Attrition
- Até 3000: 28,6% (a mais alta)
- 3000-6000: 12,7%
- 6001-10000: 12,0%
- Acima de 10000: 8,9%
- Conclusão: salário mais baixo está associado a maior attrition, com queda quase constante conforme a faixa salarial sobe.

## 7. Distância de casa x Attrition
- Longe: 20,7%
- Média Distância: 16,1%
- Perto: 13,8%
- Conclusão: distância maior de casa até o trabalho está associada a maior attrition, embora o efeito seja mais moderado que os fatores anteriores (overtime, idade e salário).

## Conclusão Geral
Os três fatores com maior influência no attrition identificados foram: **overtime** (31% vs 10%), **faixa etária jovem** (18-25 anos, 35,8%) e **salário baixo** (até 3000, 28,6%). Satisfação no trabalho e distância de casa também mostram relação, porém com efeito mais moderado. Isso sugere que ações de retenção deveriam priorizar controle de carga de trabalho (overtime) e políticas de retenção voltadas a funcionários no início de carreira e com salários mais baixos.

## Limitações
- Dataset fictício, gerado pela IBM para fins educacionais — os padrões podem não refletir uma empresa real
- `PerformanceRating` não possui valores baixos (1 ou 2), o que limita conclusões sobre desempenho x attrition
- Faixas de idade, salário e distância foram definidas de forma exploratória; outros pontos de corte poderiam revelar padrões diferentes
