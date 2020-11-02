---
author: Marcos V. Leal
date: 2020-06-20T20:19:22-03:00
lastmod: 2020-11-02T15:19:22-03:00
draft: false
title: Como usar Prettier com ESLint e TypeScript no VSCode
description: "Neste artigo, vou explicar como combinar o poderoso ESLint com o formatador de código JavaScript mais famoso do mercado."
images: ["/images/2020/06/prettier-com-eslint-e-typescript-no-vscode.png"]
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

O [Prettier](https://prettier.io/) é, de forma muito resumida, um formatador de código opinativo e totalmente configurável.

O ESLint também pode formatar o código, mas o objetivo principal da ferramenta é **garantir que estamos seguindo as convenções de estilo do projeto**.

O Prettier pode ser configurado para aplicar as formatações sempre que você colar um fragmento de código, salvar um arquivo ou pedir manualmente.

**Eu preciso do ESLint para usar o Prettier?**

A resposta é não!

Por padrão, a ferramenta já vem com um conjunto de regras comuns para limpeza de código, mas ela fica ainda mais poderosa quando a combinamos com o ESLint.

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

Até aqui, configuramos o Prettier localmente e estamos prontos para testar a formatação de alguns códigos.

Para este artigo estamos usando o código do [**typescript-simple-starter**](https://github.com/coder-arena/typescript-simple-starter), nele o único arquivo que temos é `src/index.ts`.

```ts
console.log('Nenhuma implementação...');
```

Se você também estiver usando esse projeto, remova a vírgula presente no final da linha e substitua as aspas simples por duplas, o arquivo agora estar assim:

```ts
console.log("Nenhuma implementação...")
```

Se o seu projeto não possuir, adicione ao `package.json` na sessão `scripts` o seguinte comando:

```json
{
  "scripts": {
    //...
    "format": "npx prettier '**/*.ts' '**/*.js' --write",
    //...
  }
}
```

Logo em seguida execute-o:

```bash
npm run format
```

A saída no seu terminal mostra que 1 arquivo foi alterado e que demorou 9ms (esse tempo pode variar um pouco) para ser concluída.

```bash
npm run format

> typescript-simple-starter@0.0.1-dev format /Users/marcosvinicius/git/typescript-simple-starter
> npx prettier '**/*.ts' '**/*.js' --write

src/index.ts 9ms
```

De volta ao nosso arquivo `src/index.ts`, você notará que `console.log` recebeu o ponto e vírgula ao final e teve as aspas duplas substituídas pelas simples.

```ts
console.log('Nenhuma implementação...');
```

Sem dúvida a CLI do Prettier é muito poderosa e associada aos scripts do `package.json` pode se tornar ainda mais.

**Essa não é a melhor forma de utilizar a ferramenta.**

Na minha opinião, é claro.

## Melhor abordagem

Uma das maneiras mais comuns de usar o Prettier é através da instalação da [**extensão para o VSCode**](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode).

Com ela você pode aplicar a formatação sempre que o arquivo for salvo, ou seja, o ciclo de feedback opinativo se torna muito mais rápido e produtivo.

Isso significa dizer que você não precisa colar um *Post-It* na tela do seu computador para lembrar de aplicar as convenções de formatação adotadas pela sua equipe.

### Configurando o VSCode (recomendado)

O primeiro passo é realizar a instalação da [**extensão do Prettier**](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode).

Para definir os padrões, pressione `CMD + SHIFT + P` (no MacOS) ou `CTRL + Shift + P` (no Windows) e digite `Open Settings`.

Dentre as várias opções que podem surgir, a que realmente nos interessa é a que permite edição por JSON.

![VSCode Open Settings](/images/2020/06/vscode-open-settings.png)

No arquivo que será aberto `settings.json`, se ainda não tiver sido adicionado, insira as seguintes linhas na raíz do objeto.

```json
"editor.formatOnSave": true,
"editor.formatOnPaste": true,
```

Essas configurações formatarão seu código quando você colar e quando você salvar o código de qualquer extensão de arquivo que Prettier consiga entender.

Se a raiz do projeto em que o arquivo reside contiver um `.prettierrc.js` (ou qualquer outro arquivo suportado pela ferramenta), ele usará as configurações desse arquivo para formatar seu código.

Digamos que você esteja trabalhando com várias linguagens distintas e que para alguma delas a formatação do código de forma automática seja inútil.

Você pode substituir as configurações especificando a linguagem:

```json
"editor.formatOnSave": true,
"editor.formatOnPaste": true,
"[yaml]": {
  "editor.formatOnSave": false,
  "editor.formatOnPaste": false,
},
```

Usando a configuração acima, o Prettier **não formatará o código Yaml ao colar ou salvar**, mas formatará o código ao colar ou salvar para qualquer outra linguagem que ele entenda.

Se você quiser saber quais são as configurações que eu uso no meu ambiente de desenvolvimento, [**confira esse Gist do GitHub**](https://gist.github.com/marcosleal-prd/f29f6e3977e9457187b492b0e9bc6400#file-settings-json) :wink:

### Configurando o Prettier com ESLint

Finalmente chegou o momento de abrir a caixa do mágico para ver como tudo realmente acontece.

Com o ESLint e o Prettier instalado, precisaremos instalar 2 plugins adicionais:

```bash
npm install --save-dev eslint-config-prettier eslint-plugin-prettier
```

- `eslint-config-prettier`: Desativa todas as regras do ESLint que podem estar em conflito com o Prettier.
- `eslint-plugin-prettier`: Transforma as regras do Prettier em regras do ESLint.

Para lembrar, no [artigo anterior](/posts/como-usar-eslint-em-projetos-com-typescript-e-node.js/) concluímos com o arquivo `.eslintrc.js` da seguinte forma.

```js
module.exports = {
  //...
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/eslint-recommended', // Usa as regras recomendadas do @typescript-eslint/eslint-plugin
    'plugin:@typescript-eslint/recommended', // Usa as regras recomendadas do @typescript-eslint/eslint-plugin
  ],
  //...
};
```

Agora, para que o Prettier possa trabalhar em perfeita harmonia com o ESLint, vamos alterar o `extends` para:

```js
module.exports = {
  //...
  extends: [
    'plugin:@typescript-eslint/eslint-recommended', // Usa as regras recomendadas do @typescript-eslint/eslint-plugin
    'prettier/@typescript-eslint', // Usa eslint-config-prettier para desabilitar regras ESLint de @typescript-eslint/eslint-plugin que entraria em conflito com Prettier
    'plugin:prettier/recommended', // Ativa o eslint-plugin-prettier e exibe erros Prettier como erros ESLint. Certifique-se de que esta seja sempre a última configuração no array
  ],
  //...
};
```

A partir desse momento, sempre que executarmos o comando `npm run lint`, saberemos quais linhas não foram formatadas.

Além disso, também será possível **detectar qualquer violação de convenção de código** contra as quais nos protegemos através das regras ESLint.

## Conclusão

O código completo resultante dessas configurações pode ser encontrado no [**typescript-simple-starter**](https://github.com/coder-arena/typescript-simple-starter).

É notório o poder que as ferramentas vem ganhando ao longo do tempo, assim como as verificações de estilo, também existem outras soluções para análise estática de código e de segurança.

**Vale muito a pena continuar estudando sobre cada uma delas.**

Ainda que você não utilize o VSCode, algumas configurações que fizemos aqui devem continuar sendo úteis para você.

As verificações estáticas de código, como as que fizemos aqui, e as [**Actions do GitHub**](https://github.com/features/actions) formam um casal perfeito.

Mas, é assunto para outro momento, **deixe nos comentários se você gostaria de um 3º artigo para mostrar isso**.

Gostou dessa minissérie de artigos? Compartilhe com aquele amigo que pode estar precisando entender melhor o assunto.

Um forte abraço e até a próxima.
