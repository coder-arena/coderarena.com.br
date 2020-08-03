---
author: Marcos V. Leal
date: 2020-06-20T20:19:22-03:00 # 2020-06-23T20:19:22-03:00
draft: true
title: Como usar Prettier com ESLint e TypeScript no VSCode
description: "Neste artigo, vou explicar como combinar o poderoso ESLint com o formatador de código JavaScript mais famoso do mercado."
# images: ["https://cdn.coderarena.com.br/uploads/2020/06/eslint-com-typescript-e-node-js.png"]
tags: ["ESLint", "TypeScript", "VSCode", "Prettier"]
categories: ["TypeScript"]
series: ["ESLint com TypeScript"]
sitemap:
  changefreq: "monthly"
  priority: 0.9
---

No artigo anterior desta série falamos sobre a configuração necessária para adicionar o ESLint ao nosso projeto.

Aprendemos ainda como usá-lo para garantir que o código está de acordo com as convenções definidas para o projeto.

**Lembra-se do comando que obtivemos ao final?** :flushed:

```bash
npm run lint
```

Isso realmente é incrível, mas pode ficar bem chato ter que usar este comando o tempo todo para verificação de lint.

E pode ficar ainda pior quando temos que analisar os erros e corrigi-los manualmente.

> Este é o segundo de uma pequena série de 2 artigos sobre ESLint com TypeScript:
>
> 1. [__Como usar ESLint em projetos com TypeScript e Node.JS;__](/posts/como-usar-eslint-em-projetos-com-typescript-e-node.js)
> 2. __Como usar Prettier com ESLint e TypeScript no VSCode;__

E neste artigo, vou ensiná-lo a __configurar o Prettier com ESLint e TypeScript no VSCode__.

Vamos manter toda a responsabilidade de definição de convenção de código no ESLint e a responsabilidade de formatação no Prettier.

**Continue lendo...**

## O que é o Prettier

O [Prettier](https://prettier.io/) é, de forma muito resumida, uma formatador de código opinativo e totalmente configurável.

O ESLint também pode formatar o código, mas o objetivo principal da ferramenta é **garantir que estamos seguindo as convenções de estilo do projeto**.

O Prettier pode ser configurado para aplicar as formatações sempre que você colar um fragmento de código, salvar um arquivo ou pedir manualmente.

**Eu preciso do ESLint para usar o Prettier?**

A resposta é não!

Por padrão, a ferramenta já vem com um conjunto de de regras comuns para limpeza de código, mas ela fica ainda mais poderosa quando a combinamos com o ESLint.

## Vamos juntar ESLint e Prettier

Ao combinar essas poderosas ferramentas, podemos dividir claramente as responsabilidades de acordo com a especialidade de cada uma, com isso teremos:

- ESLint: **Definindo as convenções de estilo de codigo**;
- Prettier: **Formatando o código automaticamente com base nas regras do ESLint**;

## Instalação e Configuração

O primeiro passo é a instalação do Prettier no projeto, para isso execute:

```bash
npm install --save-dev prettier
```

Seguindo a [documentação do Prettier](https://prettier.io/docs/en/index.html), podemos criar um arquivo na raiz do projeto para hospedar nossas configurações.

Como mencionado no artigo anterior, eu prefiro o formato `.js`, então crio um arquivo chamado `.prettierrc.js`.

O conteúdo poderá ser ajustado por você para atender ao padrão da sua equipe, mas aqui está o meu como um exemplo.

```js
module.exports = {
  printWidth: 80,
  tabWidth: 2,
  singleQuote: true,
  trailingComma: 'es5',
};
```

Essas regras definem o seguinte:

- `printWidth`: Define o comprimento máximo de cada linha para 80 caracteres, ou seja, se alguma exceder esse limite, o Prettier realiza a quebra automática;
- `tabWidth`: Especifica o número de espaços do recuo;
- `singleQuote`: Define se o Prettier deve usar aspas simples no código, ao definir como `true`, o Prettier substituirá qualquer aspa dupla por simples;
- `trailingComma`: Vírgulas à direita sempre que possível quando houver várias linhas, definido com `es5` exige vírgulas à direita, válidas no ES5 (objetos, matrizes etc.);

Para ver as opções adicionais para este arquivo, você pode [visitar a documentação oficial](https://prettier.io/docs/en/options.html).

## Prettier CLI
