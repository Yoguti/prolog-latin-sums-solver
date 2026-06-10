# Solver de Latin Sums em Prolog

Este projeto contém um resolvedor para o quebra cabeça Latin Sums (Lateinische Summen), implementado em Prolog utilizando a biblioteca de Programação Lógica por Restrições em Domínios Finitos (CLP(FD)).

Mais informações e exemplos interativos sobre o problema podem ser encontrados na página oficial do [Janko.at](https://www.janko.at/Raetsel/Lateinische-Summen/index.htm).

## Estrutura do Projeto

* `solver.pl`: Contém o predicado `solve/3` que implementa o modelo de restrições CLP(FD) para resolver o problema.
* `main.pl`: Script principal que inclui o resolvedor, lê as instâncias de teste e executa a resolução delas sequencialmente.
* `puzzles.pl`: Arquivo contendo as instâncias de teste do quebra cabeça.
* `webdata.csv`: Arquivo contendo dados de quebra cabeças no formato original do site Janko.at.

## Requisitos

Para executar o solver, é necessário ter instalado apenas o interpretador **SWI-Prolog** (pois ele fornece a biblioteca `clpfd` necessária por padrão).

### Instalação no Ubuntu / Debian

```bash
sudo apt update
sudo apt install swi-prolog
```

## Execução

Devido a diretiva `:- initialization(main).` no arquivo `main.pl`, o predicado de resolução de todos os testes é executado automaticamente assim que o arquivo é carregado pelo interpretador.

### Executar e fechar o interpretador

Para resolver todos os 6 quebra cabeças de teste, execute:

```bash
swipl main.pl -t halt
```
