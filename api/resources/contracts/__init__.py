from robot.api.deco import keyword
# importar o decorator do robot framework

class contracts:

    def __init__(self):
        pass

    @keyword('Contract Post Login')
    def post_login(self, login_email, login_password):

        return {
            "email": login_email,
            "password": login_password
        }
    