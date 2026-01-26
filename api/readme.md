# Robot Framework

# Robots Courses
https://robotcourses.substack.com/t/fundamentos-do-robot-framework

# Request Library
- Baseada na requests do python
- Library criada para fazer teste nas APIs 

# Projeto
https://serverest.dev/
https://jsonplaceholder.typicode.com/
https://docs.robotframework.org/docs/different_libraries/requests
https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html
https://robotcourses.substack.com/p/estilo-de-especificacao-de-testes
https://robotcourses.substack.com/p/estrutura-de-secao-e-sintaxe-de-arquivos
https://front.serverest.dev/login

npx serverest@latest

# Anotacoes
venv (Nativo do Python): 
- Simples
- Dependente requirements.txt (atualizado manualmente)

Poetry (nao nativo):
- Qual ganho em comparacao com venv? 
    pip install poetry
    Nao precisa do requirements.txt e sim pyproject.toml
    pyproject.toml: versao do python e dependencias
    Atualiza automaticamente
    Ja cria o projeto virtual

Plugin: Python e Robot framework

poetry init
poetry install --no-root
poetry env info
poetry add robotframework
poetry add robotframework-requests

On session keywords
No session (Sessionless) keywords

[Aula 5]
Estrutura de projetos

Separation Of Concerns (SoC)
    Padrao de design de projeto
    Dividir o sistema em parte menores
    Suite de teste deve estar separado da logica de teste
    Suite de teste (Tests): Negocio/funcionalidade 
    Logica de teste (Resources): Como vou fazer uma sessao, headers, outros.
        ex:
        Resource
        --connections
        --data
        --routes
        --contracts


robot -v ENV:local ./tests/
