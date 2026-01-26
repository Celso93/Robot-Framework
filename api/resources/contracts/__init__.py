from robot.api.deco import keyword

class contracts:

    def __init__(self):
        pass

    @keyword('Contract Post Login')
    def post_login(self, login_email, login_password):

        return {
            "email": login_email,
            "password": login_password
        }

    @keyword('Contract Create User')
    def create_user(self, email, administrador):

        return {
            "nome": "Teste Robot Framework",
            "email": email,
            "password": "Teste@12345",
            "administrador": administrador
        }

    @keyword('Contract Create Product')
    def create_product(self, nome):
        return {
            "nome": nome,
            "preco": 30,
            "descricao": "Produto de teste",
            "quantidade": 100
        }
