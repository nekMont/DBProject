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
def main(num, ques):
    if(num == '1'):
        if (ques == ""):
            print("A further parameter is needed for this question")
        else:
            question1(ques)
    elif(num == '2'):
        if (ques == ""):
            print("A further parameter is needed for this question")
        else:
            question2(ques)
    elif(num == '3'):
        if (ques != ""):
            print("No further parameter needed for this question")
        else:
            question3()
    elif(num == '4'):
        if (ques == ""):
            print("A further parameter is needed for this question")
        else:
            question4(ques)
    elif(num == '5'):
        if (ques != ""):
            print("No further parameter needed for this question")
        else:
            question5()
    elif(num == '6'):
        if (ques == ""):
            print("A further parameter is needed for this question")
        else:
            question6(ques)
    elif(num == '7'):
        if (ques != ""):
            print("No further parameter needed for this question")
        else:
            question7()
    elif(num == '8'):
        if (ques != ""):
            print("No further parameter needed for this question")
        else:
            question8()
    else:
        print("Invalid question number provided, must be 1-8")


#solves question 1
def question1(streetName):
    mycursor = mydb.cursor()
    query="SELECT * FROM SITE WHERE ADDRESS LIKE '%"+streetName+"%'"
    mycursor.execute(query)

    for x in mycursor:
        print(x)


#solves question 2
def question2(SchedSystem):
    mycursor = mydb.cursor()
    query="SELECT * FROM DIGITALDISPLAY WHERE SCHEDULERSYSTEM='"+SchedSystem+"'"
    mycursor.execute(query)

    for x in mycursor:
        print(x)


#solves question 3
def question3():
    #arrays to keep track of names, and repeating names pulled from the database
    names=[]
    namesRepeat=[]
    #bool to keep track of needed spacing
    spacing=False

    #query to pull names from salesman table
    mycursor = mydb.cursor()
    query="SELECT NAME FROM SALESMAN"
    mycursor.execute(query)

    #assigns names from DB to arrays
    for x in mycursor:
        #stringifies each name
        name=str(x)

        #splices string to get rid of parenthesis and commas
        name=name[2:len(name)-3]

        #appends names to appropriate arrays
        if name not in names:
            names.append(name)
        else:
            namesRepeat.append(name)

    
    print("{:<16} {:<4}".format('Names', 'cnt'))
    print('---------------------')

    #loops through names printing as it goes
    for i in names:
        #checks to see if name repeats
        if i in namesRepeat:
            #pulls all versions of the repeated name from the DB
            query="SELECT * FROM SALESMAN WHERE NAME='"+i+"'"
            mycursor.execute(query)

            #keeps track of how many times a name repeats
            n=1

            #finds out how many times a name is repeated
            for j in namesRepeat:
                if j == i:
                    n+=1

            #prints name and its repeat count
            print("{:<16} {:<4}".format(i, n),end='')

            #prints all the versions of the name
            for x in mycursor:
                if n!=1:
                    print(x, end=',')
                    n-=1
                else:
                    print(x)
        else:
            #prints non repeating names
            print("{:<16} {:<8}".format(i, '1'))



#solves question 4
def question4(PhoneNo):
    print('4')


#solves question 5
def question5():
    mycursor = mydb.cursor(buffered = True)
    sql = "select amd.empId, amd.name, admW.hours\
       from AdmWorkHours as admW, Administrator as amd\
       where amd.empId = admW.empId\
       order by hours asc;"
       
    mycursor.execute(sql)
    myresult = mycursor.fetchall()

    print("empID\t empNames\t\t total_working_hours")
    print("----------------------------------------------")

    for x in myresult:
        print(x[0], "\t\t", x[1], "\t\t", x[2])
        
    print()


#solves question 6
def question6(ModelNo):
    mycursor = mydb.cursor(buffered = True)
    userModelNo = sys.argv[1]
    print()

    sql = "select name\
        from TechnicalSupport as ts, Specializes as s\
        where s.modelNo = %s and ts.empID = s.empID;"
        
    val = (userModelNo,)

    mycursor.execute(sql, val)

    myresult = mycursor.fetchall()

    print("Name")
    print("--------------")
    for x in myresult:
        if not x:
            print("No result")
        else:
            print(x[0])
    print()


#solves question 7
def question7():
    mycursor = mydb.cursor(buffered = True)
    sql = "select s.name, avg(p.comissionRate) as avg\
       from Salesman as s, Purchases as p\
       where s.empID = p.empID\
       group by s.name;"
       
    mycursor.execute(sql)

    myresult = mycursor.fetchall()

    print("Name\t\tAvgComissionRate")
    print("--------------")
    for x in myresult:
        print(x[0], "\t\t", x[1])
    print()


#solves question 8
def question8():
    print('8')



#pulls arguments and calls main
questionNumber = str(sys.argv[1])
questionParam = ""

#pulls second argument after question number
if (len(sys.argv) > 2):
    for i in range(len(sys.argv)):
        if i > 1:
            if (i != len(sys.argv)-1):
                questionParam+=sys.argv[i]+" "
            else:
                questionParam+=sys.argv[i]
    
main(questionNumber, questionParam)