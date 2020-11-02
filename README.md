[![Netlify Status](https://api.netlify.com/api/v1/badges/b8371ea4-68d5-41e7-8a46-9b720fab22a2/deploy-status)](https://app.netlify.com/sites/adoring-swartz-c8a2d8/deploys)

# coderarena.com.br

## Bem-vindo(a) a Coder Arena :rocket:

Esse é o código fonte do [site](https://coderarena.com.br/), todos os arquivos estão abertos para consulta.

Eu estou usando o [Hugo](https://gohugo.io) para geração de site estático, ele é incrível e bastante simples de usar.

Se você está interessado em construir seu site baseado no meu, fique à vontade e siga as orientações abaixo.

## Sobre o Hugo

Hugo é uma estrutura de site de uso geral. Tecnicamente falando, ele é um gerador de sites estáticos.

Ao contrário de outros sistemas que criam dinamicamente uma página toda vez que um visitante a solicita, o Hugo **faz a construção quando você cria seu conteúdo**.

Como os sites são vistos com muito mais frequência do que editados, o Hugo é otimizado para visualização de sites, ao mesmo tempo que oferece uma ótima experiência de escrita.

Para saber como funciona o [processo de instalação](https://gohugo.io/overview/installing/) visite a documentação.

Vale lembrar que o Hugo é escrito em [Go](https://gohugo.io/overview/installing/), então você primeiro precisa instalá-lo se desejar compilar você mesmo.

[**Visite o site oficial.**](https://gohugo.io)

### Novo Post

A criação de um post é bastante facilitada pela CLI, tudo que você precisa fazer é digitar:

```bash
hugo new post/my-first-post.md
```

### Executando

Primeiro, clone esse repositório.

Estou usando o tema Ramium (fiz algumas modificações para atender às minhas necessidades).

Se você quiser usar o Ramium, basta clona-lo no diretório `themes`. Em seguida, para colocar seu site de pé, execute o comando abaixo:

```bash
hugo server --theme=ramium
```

Pronto, agora navegue até `http://localhost:1313` e provavelmente você verá o site da Coder Arena localmente.

## Deploy

Eu estou usando o [Netlify](https://www.netlify.com/), então o deploy é apenas um simples `git push` na branch `main`.

Antes eu usava o serviço da AWS para hospedagem, isso envolvida [S3](https://aws.amazon.com/pt/s3/), [Route 53](https://aws.amazon.com/pt/route53/), [CloudFront](https://aws.amazon.com/pt/cloudfront/), [Certificate Manager](https://aws.amazon.com/pt/certificate-manager/) e algumas configurações adicionais em `config.toml`.

Se ficou interessado nessa abordagem, pode conferir [esse commit](https://github.com/coder-arena/coderarena.com.br/commit/3b5cf6316fca752f5b158e5af199e60554ea7a0a) para saber como foi o processo.

## Contribua

Sinta-se à vontade para abrir questões relacionadas ao meu site ou se tiver alguma dúvida sobre as etapas para fazer isso funcionar.
