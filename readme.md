# Robot Framework

# Robots Courses
https://robotcourses.substack.com/t/fundamentos-do-robot-framework

# Request Library
- Baseada na requests do python
- Library criada para fazer teste nas APIs 

# Projeto
https://serverest.dev/
https://jsonplaceholder.typicode.com/

# Anotacoes
Git, Github, Python
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
