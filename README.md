Aqui está um modelo de **README.md** completo, profissional e pronto para ser usado no seu GitHub. Ele reflete exatamente a estrutura de banco de dados e as regras de negócio que construímos até aqui.

---

# 📦 Sistema de Controle de Estoque - Delphi & Firebird

Este projeto é um sistema de gerenciamento de estoque robusto, desenvolvido em **Delphi** com banco de dados **Firebird**, focado em integridade de dados e relatórios detalhados. O sistema permite o controle completo de produtos, desde o cadastro técnico até a movimentação de entrada e saída.

---

## 🚀 Funcionalidades

*   **Cadastro Multitabelas:** Organização profissional com tabelas independentes para Categorias, Marcas, Fornecedores e Unidades de Medida.
*   **Gestão de Movimentação:** Registro detalhado de entradas e saídas com histórico de data e hora.
*   **Regra de Integridade:** Trava de segurança que permite a exclusão apenas da última movimentação do produto, evitando erros de saldo retroativo.
*   **Relatórios Dinâmicos:** Emissão de relatórios em **FastReport** com filtros por período de data via parâmetros SQL.
*   **Arquitetura Limpa:** Separação de lógica de banco de dados em *DataModules* e *Services*.

---

## 🛠️ Tecnologias Utilizadas

*   **IDE:** Delphi (VCL)
*   **Banco de Dados:** Firebird 3.0+
*   **Gerenciador de Banco:** IBExpert
*   **Componentes de Acesso:** FireDAC
*   **Relatórios:** FastReport

---

## 📋 Estrutura do Banco de Dados (DDL)

O banco de dados foi projetado seguindo as normas de normalização para evitar redundância. Abaixo, a estrutura das tabelas principais:

| Tabela | Descrição |
| :--- | :--- |
| `CATEGORIAS` | Segmentação de tipos de produtos. |
| `FORNECEDORES` | Registro de parceiros e CNPJ. |
| `MARCAS` | Fabricantes/Marcas dos produtos. |
| `UNIDADES_MEDIDA` | Unidades de estoque (UN, KG, CX, etc). |
| `PRODUTOS` | Tabela mestre que amarra todas as categorias acima. |
| `MOVIMENTACAO` | Histórico de todas as entradas e saídas de estoque. |

---

## 🔧 Configuração e Instalação

### 1. Preparação do Banco de Dados
1.  Crie um novo banco de dados Firebird (`.fdb`) através do **IBExpert**.
2.  Execute o script SQL localizado na pasta `/SQL/ScriptCriacao.sql` (ou utilize o script DDL que definimos durante o desenvolvimento).

### 2. Configuração no Delphi
1.  Abra o arquivo do projeto (`.dproj`) no Delphi.
2.  Acesse o `DataModule` (ex: `dmPrincipal`).
3.  Configure o componente `TFDConnection` para apontar para o caminho do seu arquivo `.fdb`.
4.  Certifique-se de que a `fbclient.dll` esteja disponível no diretório do executável ou no Path do Windows.

### 3. Gerando o Executável
1.  Mude a configuração de Build para **Release**.
2.  Vá em `Project > Build [NomeDoProjeto]`.
3.  O executável será gerado na pasta `Win32/Release`.

---

## 📄 Exemplo de Filtro de Relatório

O sistema utiliza passagem de parâmetros para garantir que o banco de dados processe apenas o necessário:

```sql
/* SQL de Movimentação */
SELECT * FROM MOVIMENTACAO 
WHERE DATA_MOV BETWEEN :DATA_INI AND :DATA_FIM
ORDER BY DATA_MOV DESC
```

---

## 🤝 Contribuição

1.  Faça um **Fork** do projeto.
2.  Crie uma **Branch** para sua modificação (`git checkout -b feature/NovaFuncionalidade`).
3.  Faça o **Commit** das suas alterações (`git commit -m 'Adicionando nova funcionalidade'`).
4.  Faça o **Push** para a Branch (`git push origin feature/NovaFuncionalidade`).
5.  Abra um **Pull Request**.

---

## 📝 Licença

Este projeto é para fins de estudo e desenvolvimento profissional. Sinta-se à vontade para usá-lo e adaptá-lo.
