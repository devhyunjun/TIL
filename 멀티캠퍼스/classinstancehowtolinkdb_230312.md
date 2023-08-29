# 클래스, 인스턴스 메소트 필드 정확하게 이해하자!

class Car():
  insta=0 #클래스매소드

  def __init__(self, size, color):#초기화 함수
    self.size = size #인스턴스 필드 정의
    self.color = color

  def price(self): #self -> 인스턴스 필드 참조
    if self.color=='black':
      return 1000   #인스턴스 매소드 결과값 1000으로 반환

black = Car(10, 'black') #인스턴스 만들기
a = black.price()  #인스턴스매소드 호출
print(a)

class bank():
	totalmoney = 0
	account = []

 	#classmethod
	def pressmoney(cls): #클래스 필드(cls 넣어야함)를 조작하는 클래스 매소드 만들기
		cls.balance = cls.balance + 10000 #cls -> 추가 변수 입력 없이 클래스 필드 호출
		print("show me the money complete.")
	#classmethod
	def createac(cls, acnum): #cls에다가 추가 변수를 받아서 처리
		cls.account.append(acnum)
	
	def __init__(self, acnum, balance):
		self.acnum = acnum
		self.balance =	balance

	def commit(self, trnum): #인스턴스 필드+추가변수 받음
		if trnum in bank.account:


``` python
class 클래스:
  클래스필드='클래스필드내용'
  def __init__(self):#self->자가참조표인터->인스턴스
    self.인스턴스필드='인스턴스필드내용'
    print("인스턴스생성\n")

  #클래스메소드
  @classmethod
  def 클래스메소드_클래스필드(cls):#cls->자가참조표인터->클래스
    print("클래스메소드 호출")
    print(f'클래스필드 호출:{cls.클래스필드}')
  @classmethod
  def 클래스메소드_인스턴스필드(cls):#cls->자가참조표인터->클래스
    print("클래스메소드 호출")
    print(f'인스턴스필드 호출 (불가): 접근불가')

  #인스턴스메소드
  def 인스턴스메소드_클래스필드(self):
    print("인스턴스메소드 호출")
    print(f'클래스필드 호출:{self.클래스필드}')
  def 인스턴스메소드_인스턴스필드(self):
    print("인스턴스메소드 호출")
    print(f'인스턴스필드 호출:{self.인스턴스필드}')

print('<클래스>')
#클래스-O->클래스메소드-O->클래스필드
print('클래스-O->클래스메소드-O->클래스필드')
클래스.클래스메소드_클래스필드() 
print()

#클래스-O->클래스메소드-X->인스턴스필드 
print('클래스-O->클래스메소드-X->인스턴스필드')
클래스.클래스메소드_인스턴스필드() 
print()

#클래스-X->인스턴스메소드-O->클래스필드 
print('클래스-X->인스턴스메소드-O->클래스필드')
print("클래스에서는 인스턴스 접근 불가!")
print()

#클래스-X->인스턴스메소드-O->인스턴스필드 
print('클래스-X->인스턴스메소드-O->인스턴스필드')
print("클래스에서는 인스턴스 접근 불가!")
print()
print('-'*30)
print('<인스턴스>')

인스턴스=클래스()#인스턴스생성
#인스턴스-O->클래스메소드-O->클래스필드
print('인스턴스-O->클래스메소드-O->클래스필드')
인스턴스.클래스메소드_클래스필드() 
print()

#인스턴스-O->클래스메소드-X->인스턴스필드
print('인스턴스-O->클래스메소드-X->인스턴스필드')
인스턴스.클래스메소드_인스턴스필드() 
print()

#인스턴스-O->인스턴스메소드-O->클래스필드
print('인스턴스-O->인스턴스메소드-O->클래스필드')
인스턴스.인스턴스메소드_클래스필드()
print()

#인스턴스-O->인스턴스메소드-O->인스턴스필드
print('인스턴스-O->인스턴스메소드-O->인스턴스필드')
인스턴스.인스턴스메소드_인스턴스필드()
print()
```

