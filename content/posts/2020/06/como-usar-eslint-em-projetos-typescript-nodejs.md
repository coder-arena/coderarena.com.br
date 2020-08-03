---
author: Marcos V. Leal
date: 2020-06-10T14:15:12-03:00
lastmod: 2020-06-23T20:36:47-03:00
draft: false
title: Como usar ESLint em projetos com TypeScript e Node.JS
description: "O ESLint é uma poderosa (e plugável) ferramente de lint para JavaScript. E neste artigo vamos aprender a configurar o ESLint em seus projetos com TypeScript e Node.JS."
images: ["/images/2020/06/eslint-com-typescript-e-node-js.png"]
tags: ["ESLint", "Node.JS", "TypeScript"]
categories: ["TypeScript"]
series: ["ESLint com TypeScript"]
sitemap:
  changefreq: "monthly"
  priority: 0.9
---

**Você sabe o que são linters? E qual o impacto no seu código?**

Ao estudar uma nova linguagem uma das primeiras coisas que procuro entender é: Quais recursos e configurações são necessárias para garantir a padronização de código no projeto.

A definição de um padrão de estilo é uma das coisas indispensáveis para escrita de código limpo.

> Este é o primeiro de uma pequena série de 2 artigos sobre ESLint com TypeScript:
>
> 1. __Como usar ESLint em projetos com TypeScript e Node.JS;__
> 2. [__Como usar Prettier com ESLint e TypeScript no VSCode;__](/posts/como-usar-prettier-com-eslint-e-typescript-no-vscode)

E neste artigo, vou ensiná-lo a configurar o ESLint para uso em projetos com TypeScript e Node.JS.

**Continue lendo...**

## O que é um Linter?

Linting[^1] trata-se do processo de verificação automática do seu código em busca de erros programáticos e estilísticos. Isso é feito através de ferramentas especializadas, conhecidas como *Linters*.

Essas ferramentas podem ser softwares, utilitários e bibliotecas, tudo depende da linguagem (ou plataforma) em que está trabalhando.

#### Porque Linting é importante?

O Linting é fundamental para reduzir erros (nós desenvolvedores cometemos alguns), e melhorar a qualidade geral do seu código.

O uso de ferramentas de lint pode ajudá-lo a acelerar o desenvolvimento e reduzir os custos, localizando erros com antecedência.

Quando falamos de linguagens interpretadas como é o caso do Python e do JavaScript precisamos ainda mais de dessas ferramentas, pois não possuem uma fase de compilação.

Portanto, o uso do lint é bastante eficaz para garantia de estilo consistente e resolução de erros básicos de codificação.

## ESLint VS TSLint

**E quanto ao TypeScript? É compilado, então porque precisamos de um linter?**

O TypeScript não é uma linguagem compilada, na verdade ele é um *superset* do JavaScript e o processo que ocorre é **chamado de transpilação**[^2], não compilação.

O [ESLint](https://eslint.org/) é um *linter* JavaScript, assim como os verificadores de outras linguagens, o ESLint realiza a checagem de estilo do seu código com base nas configurações fornecidas.

Como o próprio site descreve, ele é um *Pluggable JavaScript linter*. Isso significa que além dos comportamentos padrões esperados, **a ferramenta pode ser estendida com o uso de plugins**.

Você provavelmente já deve ter ouvido falar do [TSLint](https://palantir.github.io/tslint/), equivalente do ESLint para o TypeScript.

No final do ano passado (2019), a equipe responsável pelo TSLint decidiu descontinuar o desenvolvimento da solução, existem diversos motivos para isso, [como explicado neste artigo](https://medium.com/palantir/tslint-in-2019-1a144c2317a9).

Um dos principais motivos é que o ESLint já existe e chegou ao ponto de haver muita coisa duplicada entre as duas ferramentas, que por sinal possuem o mesmo objetivo.

Não é de se assustar que no futuro, a visão é de um mundo em que desenvolvedores __JavaScript e TypeScript estejam cada vez mais juntos__.

Devido a toda a extensibilidade fornecida pelo ESLint, podemos utilizá-lo nos projetos TypeScript com a adição de alguns plugins.

**Chega de papo e vamos à configuração...**

## Instalação e Configuração

*Vamos partir do pressuposto que você já tem um projeto TypeScript inicial com o `tsconfig.json`.*

Dito isso, no seu terminal na pasta do projeto execute os passos abaixo.

```bash
npm install --save-dev eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin
```

O comando acima adiciona 3 dependências de desenvolvimento:

- `eslint`: Biblioteca principal de lint;
- `@typescript-eslint/parser`: O analisador que permitirá que o ESLint conheça o código TypeScript;
- `@typescript-eslint/eslint-plugin`: Um plug-in que contém várias regras ESLint específicas do TypeScript;

Depois de adicionar as dependências necessárias, precisamos criar o arquivo de configuração do ESLint, para isso crie o arquivo no diretório raiz do projeto e dê a ele o nome de `.eslintrc.js`.

```js
module.exports = {
  root: true,
  parser: '@typescript-eslint/parser', // Especifica o analisador ESLint
  parserOptions: {
    ecmaVersion: 2020, // Permite a análise de recursos modernos do ECMAScript
    sourceType: 'module', // Permite o uso de imports
  },
  env: {
    es6: true,
    node: true,
  },
  plugins: ['@typescript-eslint'],
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/eslint-recommended', // Usa as regras recomendadas do @typescript-eslint/eslint-plugin
    'plugin:@typescript-eslint/recommended', // Usa as regras recomendadas do @typescript-eslint/eslint-plugin
  ],
  globals: {
    Atomics: 'readonly',
    SharedArrayBuffer: 'readonly',
  },
  rules: {},
};
```

Este arquivo suporta outros formatos como JSON, YAML e até uma chave `eslintConfig` no arquivo `package.json`, mas eu gosto de usar o `.js`.

Além disso é possível adicionar outras ferramentas ao nosso setup, como o [Prettier](https://prettier.io/) por exemplo.

[**Falo sobre isso no próximo artigo dessa série**](/posts/como-usar-prettier-com-eslint-e-typescript-no-vscode) :wink:

#### Ignorando arquivos

Que é uma ótima prática ter uma ferramenta de lint configurada já sabemos, mas nem todos os arquivos devem ser visitados por ela, como por exemplo `node_modules`, `scripts` (local que pode conter arquivos `.sh`) e a pasta de distribuição final.

Para isso, crie um arquivo na raiz do projeto com o nome `.eslintignore`. Esse arquivo possui a mesma sintaxe do `.gitignore`, logo você não deverá ter problemas para adequá-lo às suas necessidades.

Podemos começar com:

```toml
dist # Isso depende de como o tsconfig.json está configurado em compilerOptions.outDir
scripts
node_modules
```

#### Adicionando um script lint

Até aqui concluímos o setup inicial para suporte do ESLint em noso projeto TypeScript, mas ainda falta um passo muito importante: Criar o script de lint no `package.json` para facilitar o uso.

Abra o seu `package.json` e dentro da chave `scripts`, crie um novo chamado de `lint` (você pode dar o nome que quiser). Ao final, será algo como:

```json
{
  "scripts": {
    //...
    "lint": "eslint . --ext .ts,.js",
    //...
  }
}
```

Este script executa a verificação de lint nos arquivos `.ts` e também nos `.js`. Mas porque isso? É muito comum ter no projeto outros arquivos de configuração com JavaScript, por exemplo, [PM2](https://pm2.keymetrics.io/), [Prettier](https://prettier.io/), etc.

Aqui estamos apenas nos certificando estabelecer nosso padrão em qualquer arquivo JavaScript ou TypeScript que tenhamos no projeto.

Lembra-se das linhas abaixo no `.eslintrc.js`?

```js
// ...
'eslint:recommended',
'plugin:@typescript-eslint/eslint-recommended',
'plugin:@typescript-eslint/recommended',
// ...
```

Essas linhas habilitam a verificação para JavaScript com `eslint:recommended` e também para TypeScript através dos plugins.

**Vamos experimentar?**

Execute no seu terminal o comando:

```bash
npm run lint
```

Com isso, todo o seu código passará por análise de estilo e de padrão, e caso não atenda à alguma regra será reportado o erro no terminal.

Para conhecer a opções fornecidas pela CLI do ESLint, [consulte a documentação oficial](https://eslint.org/docs/user-guide/command-line-interface).

## Regras

Como mencionado anteriormente, __o ESLint é extensível e facilmente customizável__. Então, caso as regras recomendadas não atendam ao padrão utilizado pela sua equipe, você pode adicionar cada uma das regras manualmente conforme demandado.

Observe a chave `rules` no arquivo `.eslintrc.js`. Aqui temos uma grande variedade de possibilidades, para conferir a relação completa [visite o site oficial](https://eslint.org/docs/rules/).

## Conclusão

Eu simplesmente adoro o ESLint, ele traz toda a credibilidade de uma ferramenta de lint robusta e toda a flexibilidade necessária para adequação aos diversos padrões de equipes.

Certamente, em 2020 podemos dedicar tempo conhecendo melhor a ferramenta, e continuarei procurando no ESLint a solução para todas as minhas necessidades de __lint para TypeScript e JavaScript__.

[No próximo artigo dessa série vamos discutir como adicionar ainda mais poder ao nosso projeto para estilo de código com ESLint e Prettier.](/posts/como-usar-prettier-com-eslint-e-typescript-no-vscode)

**E você, como tem utilizado lint em seus projetos TypeScript?** Diga nos comentários.

Gostou desse artigo? Compartilhe com aquele amigo que pode estar precisando entender melhor o assunto.

Um forte abraço e até a próxima. :smiley:

#### Referências:

- https://medium.com/palantir/tslint-in-2019-1a144c2317a9
- https://eslint.org/blog/2019/01/future-typescript-eslint
- https://github.com/Microsoft/TypeScript/issues/29288
- https://eslint.org/

[^1]: O termo vem originalmente de um utilitário Unix para C.
[^2]: Transpilação é o processo realizado para transformar código de uma linguagem em código de outra linguagem, neste caso de TypeScript para JavaScript.
