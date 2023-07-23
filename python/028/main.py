class User:
    def __init__(self, name: str, age: int, email: str):
        self.name = name
        self.age = age
        self.email = email

    def user_info(self):
        print("******************************")
        print(f"名前: {self.name}")
        print(f"年齢: {self.age}")
        print(f"メールアドレス: {self.email}")
        print("******************************")


name = input("名前を入力してください：")
age = int(input("年齢を入力してください："))
email = input("メールアドレスを入力してください：")

user = User(name, age, email)
user.user_info()
