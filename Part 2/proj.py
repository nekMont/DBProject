import mysql.connector
import sys

#connects to the sql database
mydb = mysql.connector.connect(
host="localhost",
user="dbuser",
password="Iwilldowell",
database="cs482502"
)

#Takes qeustion number to be solved as a parameter and calls appropriate function to solve the question
def main(num):
    if(num == '1'):
        question1()
    elif(num == '2'):
        question2()
    elif(num == '3'):
        question3()
    elif(num == '4'):
        question4()
    elif(num == '5'):
        question5()
    elif(num == '6'):
        question6()
    elif(num == '7'):
        question7()
    elif(num == '8'):
        question8()
    else:
        print("Invalid question number provided, must be 1-8")


#solves question 1
def question1():
    print('1')


#solves question 2
def question2():
    print('2')


#solves question 3
def question3():
    print('3')


#solves question 4
def question4():
    print('4')


#solves question 5
def question5():
    print('5')


#solves question 6
def question6():
    print('6')


#solves question 7
def question7():
    print('7')


#solves question 8
def question8():
    print('8')



#pulls argument and calls main
questionNumber = str(sys.argv[1])
main(questionNumber)