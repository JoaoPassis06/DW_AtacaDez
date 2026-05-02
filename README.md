# 🛒 Business Intelligence & Data Warehouse: AtacaDez Case

![Banner Minimalista de Dados](https://images.unsplash.com/photo-1551288049-bbbda546697c?q=80&w=1200&h=300&auto=format&fit=crop)

Este projeto apresenta a implementação completa de um pipeline de dados para o setor varejista. O foco principal foi a transformação de dados operacionais fragmentados em um **Data Warehouse de alta performance**, permitindo análises granulares de rentabilidade e ticket médio.

---

## 🏗️ O Desafio de Dados
A rede **AtacaDez** possuía dados isolados em formatos JSON, XML, CSV e XLSX. O objetivo técnico deste projeto foi centralizar essas fontes através de uma arquitetura de camadas:

1. **Ingestão (Data Lake/Staging):** Mapeamento e tipagem de dados crus.
2. **Transformação (ETL):** Limpeza e aplicação de regras de negócio via SSIS.
3. **Entrega (DW):** Modelagem dimensional para suporte à decisão.

---

## 🛠️ Engenharia Aplicada

- **Processamento de Dados:** Utilização do **SSIS (Integration Services)** para automação de carga e tratamento de dados heterogêneos.
- **Modelagem Dimensional:** Estrutura em **Star Schema** focada em reduzir a redundância e otimizar queries de agregações.
- **Linguagem de Consulta:** Desenvolvimento de scripts DDL e DML robustos em **SQL Server**.

---

## 📂 Arquitetura do Repositório

Diferente da documentação estática, este repositório está organizado para execução:

- **`Arquitetura_DW_Atacadez/`**: Contém o diagrama de relacionamento e o modelo lógico.
- **`DADOS/`**: Dataset completo fornecido pela TI (Fontes de Clientes, Produtos, Compras e Notas).
- **`Script_Data_Lake_Tabelas/`**: Scripts para provisionamento da camada de Staging.
- **`Script_Banco_Dados_Data_WareHouse/`**: Scripts para criação das dimensões e tabelas fato.
- **`DataWarehouseAtacaDez/`**: Solução do Visual Studio com os pacotes ETL.

---

## 📈 Inteligência de Negócio (KPIs Implementados)

O Warehouse foi otimizado para extrair métricas automáticas como:
* **Rentabilidade:** $$\left( \frac{Lucro}{ValorVenda} \right) \times 100$$.
* **Custo de Venda (COGS):** Baseado no preço unitário de compra capturado no input.

---

## 📄 Documentação Executiva

Para uma imersão, consulte a documentação exportada do Notion:

👉 **[Documentação_Projeto_AtacaDez.pdf](Documentação_Notion_DW_AtacaDez.pdf)**

---
