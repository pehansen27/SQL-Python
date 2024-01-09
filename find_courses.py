# Peyton Hansen
# DSCI 551 Fall 2023
# Find Courses SQL

import sys
from sqlalchemy import create_engine
import pandas as pd

def findCourses(studentID):
    # connection details
    user = 'dsci'
    password = 'Dsci-551'
    host = 'localhost'
    port = '3306'
    name = 'dsci551'

    # make connection
    connection = f"mysql+pymysql://{user}:{password}@{host}:{port}/{name}"
    engine = create_engine(connection)

    # find student courses
    query = f"""
        SELECT 
            Student.name,
            Student.program,
            Course.title,
            Take.semester
        FROM 
            Student 
        JOIN 
            Take ON Student.id = Take.sid
        JOIN 
            Course ON Take.cno = Course.number AND Take.semester = Course.semester 
        WHERE 
            Student.id = '{studentID}'
    """

    # pandas can execute query
    results = pd.read_sql(query, engine)

    return results

if __name__ == "__main__":
    # read the arguments
    if len(sys.argv) != 2:
        print("Please format as follows: python3 find_courses.py <student_id>")
        sys.exit(1)

    studentID = sys.argv[1]

    # run findCourses
    data = findCourses(studentID)

    # if no courses found
    if data.empty:
        print("No courses found for student id:", studentID)
    else:
        print(data)


