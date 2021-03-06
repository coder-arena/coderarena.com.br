---
author: Marcos V. Leal
date: 2020-04-24T10:14:35-03:00
lastmod: 2020-06-02T22:30:47-03:00
draft: false
title: 🐍 Python Package Managers, Ecossistema, Pipenv e Poetry
description: "Python é uma linguagem simples. Mas, a estrutura necessária para criação de um projeto completo não é algo tão trivial."
images: ["/images/2020/04/python-package-managers.jpg"]
videos: ["https://youtu.be/23FB9UrDxMc"]
tags: ["Package Managers", "Pipenv", "Poetry", "Python3"]
categories: ["Python"]
sitemap:
  changefreq: "monthly"
  priority: 0.9
---

Python é uma linguagem simples, é possível desenvolver funcionalidades com poucas linhas. Mas, a estrutura necessária para criação de um projeto completo não é algo tão trivial.

## Tech Talks JS+

Recentemente tive a oportunidade de falar em uma Tech Talk na [**Juntos Somos Mais**](https://juntossomosmais.com.br) sobre gerenciadores de pacote Python, especialmente sobre Pipenv e Poetry.

**Você pode assistir o vídeo completo aqui!**

{{< youtube 23FB9UrDxMc >}}

## História e Versões

> "Python é uma linguagem de programação de alto nível, interpretada, de script, imperativa, orientada a objetos, funcional, de tipagem dinâmica e forte.[^1]"

Sua flexibilidade permite fazer muitas coisas. O Python pode ser usado para escrever programas simples e possui toda a potência necessária para criar soluções *enterprise* complexas e de larga escala.

**O uso tem se dado principalmente em:**

- Criação de aplicativos desktop, inclusive jogos;
- Desenvolvimento de páginas web e APIs;
- Análise matemática e ciência de dados;

É possível encontrar grandes marcas que fazem uso massivo do Python em suas aplicações, como [Reddit](https://www.reddit.com/), [Dropbox](https://www.dropbox.com/pt_BR/) e [YouTube](https://www.youtube.com/?gl=BR).

Há um conto que diz que sempre que o player do YouTube é ativado, um script Python é executado - *mito ou verdade? não sei dizer!*

**Principais propriedades do Python:**

1. **Case sensitive:** Faz diferenciação entre maiúsculas e minúsculas. Ex: `Token` é diferente de `token`;
2. **Fortemente tipado:** Aplica tipos de dados para previnir operações inconsistentes entre tipos;
3. **Dinâmico, implicitamente tipado:** Você não precisa declarar os tipos explicitamente para às suas variáveis (**não precisa, mas pode**). Isso significa dizer, que a tipagem é imposta em tempo de execução;
4. **Orientado a Objetos:** Tudo no Python é considerado um objeto;

### Zen of Python

É um conjunto composto por **19 princípios orientadores** para escrita de programas que influenciam no design da linguagem. Esse conjunto foi escrito e proposto por [Tim Peters](https://en.wikipedia.org/wiki/Tim_Peters_(software_engineer)) em 1999.

Com o Python instalado, digite `python` no seu terminal. No REPL[^2] que será aberto insira o comando `import this` e pressione ENTER.

*Traduzido para pt-br*

```
Bonito é melhor que feio.
Explícito é melhor que implícito.
Simples é melhor que complexo.
Complexo é melhor que complicado.
Flat é melhor que aninhado.
Esparso é melhor que denso.
Legibilidade conta.
Casos especiais não são especiais o suficiente para violar as regras.
Embora praticidade supere a pureza.
Os erros nunca devem passar silenciosamente.
A menos que seja explicitamente silenciado.
Diante da ambiguidade, recuse a tentação de adivinhar.
Deve haver uma - e preferencialmente apenas uma - maneira óbvia de fazê-lo.
Embora esse caminho possa não ser óbvio a princípio, a menos que você seja holandês.
Agora é melhor do que nunca.
Embora nunca seja melhor do que * agora * agora.
Se a implementação é difícil de explicar, é uma má ideia.
Se a implementação é fácil de explicar, pode ser uma boa ideia.
Os espaços para nome são uma ótima idéia - vamos fazer mais!
```

Apesar da crescente popularidade o Python não é uma linguagem nova, foi lançado publicamente na década de 90 por [Guido van Rossum](https://pt.wikipedia.org/wiki/Guido_van_Rossum).

Uma visão encurtada da evolução da linguagem ao longo dos anos pode ser vista abaixo:

**1991** - Python 0.9.0 (primeira versão pública)\
**1994** - Python 1.0\
**2000** - Python 2.0\
**2008** - Python 3.0 e Python 2.6\
**2009** - Python 3.1\
**2010** - Python 2.7\
**2011** - Python 3.2\
**2012** - Python 3.3\
**2014** - Python 3.4 (pip como instalador de pacotes padrão do Python PEP 453)\
**2015** - Python 3.5\
**2018** - Python 3.7\
**2019** - Python 3.8\
**2020** - Python 3.8.2 (10/03), descontinuação do Python 2.7 e prévia do Python 3.9.0

## Ecossistema Python

O ecossistema Python é composto por algumas entidades que no início podem ser um pouco confusas, mas vou tentar explicar o que fazem as principais.

### Python Brasil

A comunidade [Python Brasil](https://python.org.br/) reúne grupos de usuários de todo o Brasil interessados em difundir e divulgar a linguagem de programação.

O objetivo é reunir todo conteúdo produzido e traduzido pela comunidade brasileira, bem como informações relevantes para a linguagem.

### Python Software Foundation (PSF)

> The mission of the Python Software Foundation is to promote, protect, and advance the Python programming language, and to support and facilitate the growth of a diverse and international community of Python programmers.
>
> —from the Mission Statement page[^3]

A Python Software Foundation, ou PSF, é uma empresa sem fins lucrativos que detém os direitos de propriedade intelectual por trás da linguagem Python. A empresa gerencia o código-fonte aberto desde a versão 2.1 e as marcas envolvidas no ecossistema.

A PSF é a realizadora da [PyCon](http://us.pycon.org/), conferência norte-americana de Python, além disso a empresa apoia outros eventos de Python em todo o mundo.

### Python.org

Site oficial do Python, nele é possível encontrar todos os links relativos ao ecossistema da linguagem, binários para download, informativos de releases e as PEPs[^4].

### PyPA

Python Package Authority, é um subgrupo de pessoas dentro da PSF responsável por manter um conjunto principal de projetos usados no empacotamento do Python.

A PyPA publica o <https://packaging.python.org/> como recurso autorizado sobre como empacotar, publicar e instalar projetos Python usando ferramentas atuais.

Contudo, não define quais bibliotecas entrarão como padrão no Python e nem quais são as ferramentas terceiras reconhecidas pela linguagem.

**Principais ferramentas mantidas pela PyPA:**

- [**setuptools**](https://packaging.python.org/key_projects/#easy-install) `setup.py`: Utilizado na construção e distribuição de projetos Python;
- [**wheel**](https://packaging.python.org/key_projects/#wheel) `projeto-01.wheel`: Formato de arquivo binário final;
- [**pypi.org**](https://pypi.org/): Repositório de pacotes Python;
- [**virtualenv**](https://packaging.python.org/key_projects/#virtualenv) `venv`: Ferramenta para criação de ambientes isolados;
- [**pip**](https://packaging.python.org/key_projects/#pip): A ferramenta mais popular para a instalação de pacotes Python e está incluída nas versões mais recentes do Python;
- [**Pipfile**](https://packaging.python.org/key_projects/#pipfile): Alternativa centrada em aplicativos de nível superior ao arquivo de nível inferior do pip `requirements.txt`;
- [**Pipenv**](https://packaging.python.org/key_projects/#pipenv): Projeto que visa trazer o melhor de todos os mundos de embalagens para o mundo Python, utiliza: **Pipfile**, **pip** e **virtualenv**;

### PyPI

Repositório de pacotes Python, nele você poderá buscar, instalar e publicar pacotes.

## Package Managers

As PEPs 517 e 518 definem o padrão para o arquivo `pyproject.toml` e estipulam uma seção chamada `[build-system]`. De forma simplificada, esse padrão serve para especificar:

- [PEP 517](https://www.python.org/dev/peps/pep-0517/): Como um pacote deverá ser criado a partir do código fonte;
- [PEP 518](https://www.python.org/dev/peps/pep-0518/): Quais pacotes precisam ser instalados antes de tentar construir, ou seja, os requisitos de construção;

Essas PEPs em conjunto definem um padrão simples para a gestão de dependências em aplicações e pacotes a serem publicados na PyPI.

### Pipenv

O [**Pipenv**](https://github.com/pypa/pipenv) surgiu como uma boa proposta de solução para gerenciamento de pacotes Python, inteligente, feita pensando em humanos.

Com a promessa de controlar não só as versões de dependências como também gerenciar os ambientes virtuais.

**Mas as promessas não se cumpriram...** :cry:

O tempo passou e a ferramenta ficou praticamente 1 ano e meio sem nenhuma atualização, o que deixou a comunidade bastante insatisfeita, principalmente pela falta de um posicionamento consistente por parte do time desenvolvedor da "solução".

No momento em que eu escrevo este artigo uma versão foi publicada. No entanto, o Pipenv continua em desacordo com o **padrão estipulado pelas PEPs 517 e 518**.

### Poetry

Com tudo isso, qual ferramenta usar?

Existem inúmeras alternativas, cada uma com suas particularidades. E neste artigo eu vou apresentar a minha opção favorita, [**o Poetry**](https://python-poetry.org/).

O Poetry está de acordo com o padrão mencionado anteriormente, além disso a ferramenta tem recursos que facilitam a publicação de pacotes diretamente no PyPI.

O arquivo `pyproject.toml` de um projeto que utiliza o Poetry é semelhante ao mostrado abaixo.

```toml
[tool.poetry]
name = "blog-python"
version = "0.1.0"
description = "Blog with Python and Poetry"
authors = ["Marcos V. Leal <marcosleal.prd@gmail.com>"]
maintainers = ["Marcos V. Leal <marcosleal.prd@gmail.com>"]
license = "MIT"
readme = "README.md"
homepage = "https://github.com/marcosleal-prd/blog-python-poetry"
repository = "https://github.com/marcosleal-prd/blog-python-poetry"
keywords = ["Python", "Poetry", "Django", "Docker"]

[tool.poetry.dependencies]
python = "^3.7"
django = "^3.0.4"
psycopg2-binary = "^2.8.4"
django-filter = "^2.2.0"
drf-extensions = "^0.6.0"
python-json-logger = "^0.1.11"
request-id-django-log = "^0.1.1"
djangorestframework = "^3.11.0"
django-model-utils = "^4.0.0"
boto3 = "^1.12.39"
drf-link-navigation-pagination = "^0.0.4"

[tool.poetry.dev-dependencies]
pytest = "^5.2"
black = "^19.10b0"
isort = "^4.3.21"
pylint = "^2.4.4"
pylint-django = "^2.0.15"
pycodestyle = "^2.5.0"
flake8 = "^3.7.9"
mypy = "^0.770"
pytest-django = "^3.9.0"
pytest-env = "^0.6.2"
pytest-mock = "^3.0.0"

[build-system]
requires = ["poetry>=0.12"]
build-backend = "poetry.masonry.api"
```

Nesse arquivo você pode notar a presença dos elementos básico, dependências, dependências de desenvolvimento, `[build-system]` e alguns outros metadados.

Além dessas chaves, você também pode adicionar outras informações de configuração, como por exemplo [isort](https://github.com/timothycrosley/isort), [black](https://github.com/psf/black) e [tox](https://tox.readthedocs.io/en/latest/).

Já deu para notar que essa é uma combinação poderosa, certo?

## Conclusão

O Poetry é realmente muito simples, desde a sua instalação até o seu uso. Acredito que assim que visitar o site oficial chegará à mesma conclusão.

Meu conselho é **não se prender a uma ùnica solução**, experimente outras, entenda como funcionam. Esse tipo de ferramenta costuma ser bastante volátil.

Espero sinceramente que tenha gostado e que esse conteúdo o ajude a tornar o seu ambiente de desenvolvimento com Python ainda mais gostoso (ou pelo menos no que diz respeito a gestão de dependências).

**Não esqueça de deixar suas dúvidas, críticas ou sugestões de temas.** :wink:

Um forte abraço e até a próxima.

**Links:**

- [**Projeto no Github**](https://github.com/marcosleal-prd/blog-python-poetry)
- [**Slides no Speaker Deck**](https://speakerdeck.com/marcosleal_prd/python-package-managers-ecossistema-pipenv-e-poetry)

[^1]: Definição criada pelo autor da linguagem Guido van Rossum na [página do Wikipédia](https://pt.wikipedia.org/wiki/Python).
[^2]: REPL (Read, Evaluate, Print and Loop) é acrônimo para Leitura, Avaliação, Impressão e Loop, porque é exatamente isso que o computador faz.
[^3]: Conceito retirado da [página de declaração de missão](https://www.python.org/psf/mission/) da Python Software Foundation.
[^4]: Proposta de aprimoramento de Python ([PEP no site oficial](https://www.python.org/dev/peps/)).
