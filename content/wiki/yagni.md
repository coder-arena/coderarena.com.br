---
author: Marcos V. Leal
date: 2020-06-01T20:39:06-03:00
draft: false
title: Yagni
description: "Yagni é um acrônimo para “You aren’t gonna need it”. É um princípio da Extreme Programming (XP), que geralmente é usado em equipes de software ágeis."
tags: ["Princípios de Design", "Extreme Programming"]
sitemap:
  changefreq: "yearly"
  priority: 0.8
---

Yagni é um acrônimo para __"You aren't gonna need it"__. É um princípio da **Extreme Programming (XP)**, que geralmente é usado em equipes de software ágeis.

Essa afirmação diz que qualquer capacidade que presumimos que o software deve ter no futuro não deve ser criada agora porque "você não precisará disso", ou seja, **não crie nada até que seja realmente necessário**.

O Yagni (juntamente com o DRY) é uma das maneiras de se referir ao princípio de Simplicidade Assumida do XP.

Apesar de ser um conceito simples, ainda é motivo de confusão para muitos na hora da sua aplicação. Vamos a um exemplo para melhorar o entendimento.

## Cenário de Aplicação

Imagine que estou trabalhando em um sistema de recrutamento (vamos ignorar as particularidades envolvidas nesse segmento).

A aplicação é composta por 2 componentes principais: Um para vagas e outro para candidaturas. Existe uma dependência tão grande que **o componente de candidatura não pode ser criado até que o componente de vagas esteja completamente concluído**.

Neste momento a equipe está trabalhando na atualização do sistema de vagas, para permitir a criação de vagas com mais de uma cidade. A equipe sabe também que em alguns meses haverá a necessidade de suportar geolocalização.

Aproveitando que já estão atuando no mecanismo de endereços, decide-se criar o recurso presuntivo para geolocalização agora.

O Yagni vai contra essa prática, como você não precisará do recurso de geolocalização pelos próximos meses, **não deve implementá-lo até que seja realmente necessário**.

Os argumentos para essa oposição são convincentes:

- Por mais que você imagine que irá precisar do recurso presuntivo, é provável que esteja errado;
- É muito complicado prever necessidades com antecedência, o início é o momento em que menos se conhece o domínio da solução;
- Há custos muito altos envolvidos ao se criar algo que poderá nunca ser utilizado;

A abordagem mais ideal seria, criar apenas os recursos necessários para as funcionalidades requeridas.

Manter o código maleável o suficiente para que a nova funcionalidade de geolocalização possa ser implementada, se mantida, sem grandes dificuldades.

Um exercício interessante para situações como esta, é pensar em **como seria a refatoração para a adição do recurso presuntivo**, essa reflexão pode ser bastante útil.

{{< tweet 1264996212123582465 >}}

E quando digo útil, me refiro a toda a economia que pode ser conquistada, isso porque existem custos quando se ignora o Yagni.

#### Custo de construção

O primeiro e mais óbvio dos custos é o de construção, todo o esforço gasto em análises, programação e testes.

Você pode questionar: E se eu estiver certo? Após alguns meses já terei a funcionalidade de geolocalização pronta para ser disponibilizada.

Sim, mas ainda haverão outros dois custos decorrentes dessa construção prematura, o **custo do valor atrasado** e o **custo do transporte**.

#### Custo do valor atrasado

Durante o período em que o recurso de geolocalização está sendo desenvolvido, deixamos de entregar uma outra funcionalidade completa para que já pudéssemos gerar receita com ela.

Isso significa que todo o valor que o software poderia entregar está retido pelo desenvolvimento adicional desnecessário.

#### Custo do transporte

A adição imediata de um recurso presuntivo irá acrescentar mais complexidade ao software, o que dificulta a modificação do sistema, aumentando o custo ainda mais para outros recursos.

Além disso **temos um custo para continuar com todos os recursos criados** entre agora e o momento em que o recurso de geolocalização começa a ser útil.

Se nunca precisarmos da nova *feature*, teremos ainda o custo de continuar com tudo o que foi criado para ela até tudo ser removido.

Uma das grandes estrelas do desenvolvimento de software ágil é a capacidade de mudar os requisitos do sistema, se hoje temos um escopo que não contempla a posição por coordenadas, na semana seguinte podemos tê-la.

**O recurso certo construído errado é um aspecto importante a ser considerado.**

Como desenvolvedores de software, estamos em processa de aprendizagem contínua sobre tudo, sobre código, ferramentas, práticas e processos.

Já aconteceu de olhar para um código escrito tempos atrás e pensar: "Como é que eu fiz uma coisa dessas?"

Não se preocupe, isso acontece o tempo todo. E que bom, afinal estamos sempre aprendendo a fazer melhor, e melhor e melhor ainda.

Essa evolução **resulta no acúmulo de Débitos Técnicos** (assunto para uma outra wiki), que também representam custo, e portanto devem ser levados em consideração sempre.

Chegamos ao final com **três tipos de recursos presuntivos** e **quatro tipos de custos** que ocorrem quando você os negligência o Yagni.

![Custos Yagni](https://cdn.coderarena.com.br/uploads/2020/05/yagni-costs.png)

## Conclusão

Certamente há muitas outras questões por trás de um princípio tão simples quanto o __Yagni__, mas o conceito primordial foi explicado.

**O Yagni se aplica apenas aos recursos adicionados ao software para oferecer suporte a um recurso presuntivo; não se aplica ao esforço para facilitar as atualizações do software.**

Um outro argumento válido é que o Yagni tem aplicação apenas quando você introduz complexidade extra agora que não será aproveitado até posteriormente.

Se você adiciona algo olhando para uma necessidade futura que não implica no aumento da complexidade do software, não há necessidade de retomar o Yagni.

O Yagni deve ser combinado com testes automatizados, CI e refatoração contínua, sem os quais **você pode acabar com muitos débitos técnicos e retrabalho**.

Boas práticas de código, os princípios envolvidos e um conhecimento mais profundo de refatoração o ajudará na utilização bem sucedida de Yagni.
